#define _GNU_SOURCE
#include <android/log.h>
#include <arpa/inet.h>
#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <linux/ethtool.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/net_tstamp.h>
#include <linux/sockios.h>
#include <net/if.h>
#include <net/if_arp.h>
#include <pthread.h>
#include <stdarg.h>
#include <stdatomic.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>

#define LOG_TAG "mosey_shim"
#define ALOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define ALOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

#define WLC_IOCTL_MAGIC        0x14e46c77u
#define WLC_GET_MONITOR        107
#define WLC_SET_MONITOR        108
#define WLC_GET_VAR            262
#define WLC_SET_VAR            263
#define NEX_INJECT_FRAME       408
#define NEX_SET_MON_613        0x613

#define IOCTL_ART_CMD          0x89f1u
#ifndef ARPHRD_IEEE80211_RADIOTAP
#define ARPHRD_IEEE80211_RADIOTAP 803
#endif
#ifndef SIOCSHWTSTAMP
#define SIOCSHWTSTAMP 0x89b0
#endif
#ifndef TUNSETIFF_IOCTL
#define TUNSETIFF_IOCTL 0x400454cau
#endif

extern uint16_t wf_chspec_aton(const char *a);

struct nex_ioctl {
    uint32_t cmd;
    void *buf;
    uint32_t len;
    uint8_t set;
    uint32_t used;
    uint32_t needed;
    uint32_t driver;
};

struct inject_frame {
    uint16_t len;
    uint8_t pad;
    uint8_t type;
    uint8_t data[];
} __attribute__((packed));

struct android_wifi_priv_cmd {
    char *buf;
    uint32_t used_len;
    uint32_t total_len;
};

#define MAX_TRACKED_FDS 4096
static uint8_t fd_is_sock_raw[MAX_TRACKED_FDS];
static uint8_t fd_is_mon_bound[MAX_TRACKED_FDS];
static uint8_t fd_is_mosey_tun[MAX_TRACKED_FDS];

static pthread_once_t init_once = PTHREAD_ONCE_INIT;
static pthread_mutex_t io_lock = PTHREAD_MUTEX_INITIALIZER;
static int cached_ioc_fd = -1;
static uint16_t cached_chanspec = 0;
static int cached_mon_active = 0;
static atomic_uint tx_count = 0;
static atomic_uint chan_count = 0;

static unsigned int (*real_if_nametoindex)(const char *) = NULL;
static int (*real_socket)(int, int, int) = NULL;
static int (*real_bind)(int, const struct sockaddr *, socklen_t) = NULL;
static int (*real_close)(int) = NULL;
static int (*real_dup)(int) = NULL;
static int (*real_dup2)(int, int) = NULL;
static int (*real_dup3)(int, int, int) = NULL;
static int (*real_ioctl)(int, int, ...) = NULL;
static ssize_t (*real_send)(int, const void *, size_t, int) = NULL;
static ssize_t (*real_sendto)(int, const void *, size_t, int, const struct sockaddr *, socklen_t) = NULL;
static ssize_t (*real_sendmsg)(int, const struct msghdr *, int) = NULL;
static ssize_t (*real_write)(int, const void *, size_t) = NULL;

static void resolve_syms(void) {
    real_if_nametoindex = (unsigned int (*)(const char *))dlsym(RTLD_NEXT, "if_nametoindex");
    real_socket = (int (*)(int, int, int))dlsym(RTLD_NEXT, "socket");
    real_bind = (int (*)(int, const struct sockaddr *, socklen_t))dlsym(RTLD_NEXT, "bind");
    real_close = (int (*)(int))dlsym(RTLD_NEXT, "close");
    real_dup = (int (*)(int))dlsym(RTLD_NEXT, "dup");
    real_dup2 = (int (*)(int, int))dlsym(RTLD_NEXT, "dup2");
    real_dup3 = (int (*)(int, int, int))dlsym(RTLD_NEXT, "dup3");
    real_ioctl = (int (*)(int, int, ...))dlsym(RTLD_NEXT, "ioctl");
    real_send = (ssize_t (*)(int, const void *, size_t, int))dlsym(RTLD_NEXT, "send");
    real_sendto = (ssize_t (*)(int, const void *, size_t, int, const struct sockaddr *, socklen_t))dlsym(RTLD_NEXT, "sendto");
    real_sendmsg = (ssize_t (*)(int, const struct msghdr *, int))dlsym(RTLD_NEXT, "sendmsg");
    real_write = (ssize_t (*)(int, const void *, size_t))dlsym(RTLD_NEXT, "write");
}

static inline void ensure_init(void) {
    pthread_once(&init_once, resolve_syms);
}

static int get_ioc_fd_locked(void) {
    if (cached_ioc_fd >= 0) return cached_ioc_fd;
    cached_ioc_fd = real_socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
    return cached_ioc_fd;
}

static int nex_ioctl_locked(uint32_t cmd, void *buf, uint32_t len, uint8_t set) {
    int s = get_ioc_fd_locked();
    if (s < 0) return -1;
    struct ifreq ifr;
    struct nex_ioctl ioc;
    memset(&ifr, 0, sizeof(ifr));
    snprintf(ifr.ifr_name, IFNAMSIZ, "wlan0");
    memset(&ioc, 0, sizeof(ioc));
    ioc.cmd = cmd;
    ioc.buf = buf;
    ioc.len = len;
    ioc.set = set;
    ioc.driver = WLC_IOCTL_MAGIC;
    ifr.ifr_data = &ioc;
    int rc = real_ioctl(s, SIOCDEVPRIVATE, &ifr);
    if (rc < 0 && errno == EBADF) {
        cached_ioc_fd = -1;
        s = get_ioc_fd_locked();
        if (s >= 0) rc = real_ioctl(s, SIOCDEVPRIVATE, &ifr);
    }
    return rc;
}

static int wl_iovar_set_int_locked(const char *name, uint32_t val) {
    char buf[64];
    size_t nlen = strlen(name) + 1;
    if (nlen + sizeof(uint32_t) > sizeof(buf)) return -1;
    memset(buf, 0, sizeof(buf));
    memcpy(buf, name, nlen);
    memcpy(buf + nlen, &val, sizeof(uint32_t));
    return nex_ioctl_locked(WLC_SET_VAR, buf, (uint32_t)(nlen + sizeof(uint32_t)), 1);
}

static void ensure_wlan0_up_locked(void) {
    int s = get_ioc_fd_locked();
    if (s < 0) return;
    struct ifreq ifr;
    memset(&ifr, 0, sizeof(ifr));
    snprintf(ifr.ifr_name, IFNAMSIZ, "wlan0");
    if (real_ioctl(s, SIOCGIFFLAGS, &ifr) == 0 && (ifr.ifr_flags & IFF_UP) == 0) {
        ifr.ifr_flags |= IFF_UP | IFF_RUNNING;
        if (real_ioctl(s, SIOCSIFFLAGS, &ifr) < 0) {
            ALOGE("SIOCSIFFLAGS(wlan0 UP) failed: errno=%d", errno);
            return;
        }
        /* Re-entering UP after daemon downed wlan0 resets firmware monitor/power state */
        cached_mon_active = 0;
        cached_chanspec = 0;
        wl_iovar_set_int_locked("mpc", 0);
        wl_iovar_set_int_locked("scansuppress", 1);
        ALOGI("wlan0 brought UP for monitor/injection");
    }
}

static void cleanup_mon_locked(void) {
    if (cached_mon_active) {
        uint32_t mode = 0;
        nex_ioctl_locked(NEX_SET_MON_613, &mode, sizeof(mode), 1);
    }
    wl_iovar_set_int_locked("scansuppress", 0);
    wl_iovar_set_int_locked("mpc", 1);
    cached_mon_active = 0;
    cached_chanspec = 0;
    ALOGI("wlan0 monitor/injection state restored");
}

static void ensure_mon_active_locked(int force) {
    ensure_wlan0_up_locked();
    if (cached_mon_active && !force) return;
    uint32_t mode = 2;
    if (nex_ioctl_locked(NEX_SET_MON_613, &mode, sizeof(mode), 1) == 0) {
        cached_mon_active = 1;
    } else {
        ALOGE("NEX_SET_MON_613 failed: errno=%d", errno);
    }
}

static uint16_t parse_art_chan(const char *cmd) {
    unsigned int ch = 0, bw = 20;
    char band[16] = {0};
    int n = sscanf(cmd, "ART_SET_CHAN %u %15s %u", &ch, band, &bw);
    if (n < 1 || ch == 0) return 0;
    char cs_str[32];
    char b = (band[0] == '2' || (n < 2 && ch <= 14)) ? '2' : '5';
    snprintf(cs_str, sizeof(cs_str), "%cg%u/%u", b, ch, bw);
    uint16_t cs = wf_chspec_aton(cs_str);
    if (cs == 0 && b == '2' && bw > 20) {
        snprintf(cs_str, sizeof(cs_str), "2g%u/20", ch);
        cs = wf_chspec_aton(cs_str);
    }
    return cs;
}

static int handle_art_ioctl(struct ifreq *ifr) {
    if (!ifr || !ifr->ifr_data) {
        errno = EINVAL;
        return -1;
    }
    struct android_wifi_priv_cmd *priv = (struct android_wifi_priv_cmd *)ifr->ifr_data;
    if (!priv->buf || priv->total_len == 0) {
        errno = EINVAL;
        return -1;
    }

    pthread_mutex_lock(&io_lock);
    ensure_wlan0_up_locked();

    if (strncmp(priv->buf, "ART_GET_IF_ADDR", 15) == 0) {
        struct ifreq mac_ifr;
        memset(&mac_ifr, 0, sizeof(mac_ifr));
        snprintf(mac_ifr.ifr_name, IFNAMSIZ, "wlan0");
        int s = get_ioc_fd_locked();
        int rc = (s >= 0) ? real_ioctl(s, SIOCGIFHWADDR, &mac_ifr) : -1;
        if (rc == 0) {
            const uint8_t *m = (const uint8_t *)mac_ifr.ifr_hwaddr.sa_data;
            int w = snprintf(priv->buf, priv->total_len,
                             "%02x:%02x:%02x:%02x:%02x:%02x",
                             m[0], m[1], m[2], m[3], m[4], m[5]);
            priv->used_len = (w > 0) ? (uint32_t)w : 0;
            ALOGI("ART_GET_IF_ADDR -> %s", priv->buf);
            pthread_mutex_unlock(&io_lock);
            return 0;
        }
        pthread_mutex_unlock(&io_lock);
        return -1;
    }

    if (strncmp(priv->buf, "ART_SET_CHAN", 12) == 0) {
        uint16_t cs = parse_art_chan(priv->buf);
        unsigned int cidx = atomic_fetch_add(&chan_count, 1);
        if (cidx < 10) ALOGI("%s -> cs=0x%04x", priv->buf, cs);
        int rc = 0;
        if (cs != 0 && cs != cached_chanspec) {
            wl_iovar_set_int_locked("mpc", 0);
            wl_iovar_set_int_locked("scansuppress", 1);
            rc = wl_iovar_set_int_locked("chanspec", (uint32_t)cs);
            if (rc == 0) {
                /* Always ensure 0x613=2 binds monitor to the active RSDB core */
                ensure_mon_active_locked(1);
                cached_chanspec = cs;
            } else {
                ALOGE("chanspec 0x%04x failed: errno=%d", cs, errno);
            }
        } else {
            ensure_mon_active_locked(0);
        }
        snprintf(priv->buf, priv->total_len, "OK");
        priv->used_len = 2;
        pthread_mutex_unlock(&io_lock);
        return rc;
    }

    if (strncmp(priv->buf, "ART_BSSID", 9) == 0 ||
        strncmp(priv->buf, "ART_TX_RATE", 11) == 0 ||
        strncmp(priv->buf, "ART_", 4) == 0) {
        ALOGI("ART stubbed cmd: %.48s", priv->buf);
        snprintf(priv->buf, priv->total_len, "OK");
        priv->used_len = 2;
        pthread_mutex_unlock(&io_lock);
        return 0;
    }

    pthread_mutex_unlock(&io_lock);
    errno = EOPNOTSUPP;
    return -1;
}

static int is_radiotap_ifname_input_ioctl(unsigned int req) {
    switch (req) {
        case SIOCGIFINDEX:
        case SIOCGIFFLAGS:
        case SIOCSIFFLAGS:
        case SIOCGIFMTU:
        case SIOCSIFMTU:
        case SIOCGIFHWADDR:
        case SIOCGIFADDR:
        case SIOCSIFADDR:
        case SIOCGIFBRDADDR:
        case SIOCGIFNETMASK:
        case SIOCETHTOOL:
        case SIOCSHWTSTAMP:
            return 1;
        default:
            return 0;
    }
}

static ssize_t handle_raw_tx(int fd, const void *buf, size_t len) {
    if (!buf || len == 0 || len > 3900) {
        errno = EINVAL;
        return -1;
    }
    uint8_t pkt_buf[4096];
    struct inject_frame *frm = (struct inject_frame *)pkt_buf;
    frm->len = (uint16_t)(len + sizeof(*frm));
    frm->pad = 0;
    frm->type = 1; /* buffer starts with ieee80211_radiotap_header */
    memcpy(frm->data, buf, len);

    pthread_mutex_lock(&io_lock);
    ensure_mon_active_locked(0);
    int rc = nex_ioctl_locked(NEX_INJECT_FRAME, frm, frm->len, 1);
    pthread_mutex_unlock(&io_lock);

    unsigned int tidx = atomic_fetch_add(&tx_count, 1);
    if (tidx < 5 || rc < 0) {
        ALOGI("TX fd=%d len=%zu rc=%d errno=%d", fd, len, rc, rc < 0 ? errno : 0);
    }
    if (rc < 0) {
        errno = EIO;
        return -1;
    }
    return (ssize_t)len;
}

unsigned int if_nametoindex(const char *ifname) {
    ensure_init();
    if (ifname && strcmp(ifname, "radiotap0") == 0) {
        return real_if_nametoindex("wlan0");
    }
    return real_if_nametoindex(ifname);
}

int socket(int domain, int type, int protocol) {
    ensure_init();
    int fd = real_socket(domain, type, protocol);
    if (fd >= 0 && fd < MAX_TRACKED_FDS) {
        fd_is_sock_raw[fd] = (domain == AF_PACKET && (type & 0xf) == SOCK_RAW) ? 1 : 0;
        fd_is_mon_bound[fd] = 0;
        fd_is_mosey_tun[fd] = 0;
    }
    return fd;
}

int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen) {
    ensure_init();
    int rc = real_bind(sockfd, addr, addrlen);
    if (rc == 0 && sockfd >= 0 && sockfd < MAX_TRACKED_FDS &&
        fd_is_sock_raw[sockfd] && addr && addrlen >= sizeof(struct sockaddr_ll) &&
        addr->sa_family == AF_PACKET) {
        const struct sockaddr_ll *sll = (const struct sockaddr_ll *)addr;
        unsigned int wlan0_idx = real_if_nametoindex("wlan0");
        if (wlan0_idx > 0 && sll->sll_ifindex == (int)wlan0_idx) {
            fd_is_mon_bound[sockfd] = 1;
            pthread_mutex_lock(&io_lock);
            ensure_mon_active_locked(0);
            pthread_mutex_unlock(&io_lock);
            ALOGI("bound AF_PACKET SOCK_RAW fd=%d to wlan0 (idx=%u)", sockfd, wlan0_idx);
        }
    }
    return rc;
}

int close(int fd) {
    ensure_init();
    if (fd >= 0 && fd < MAX_TRACKED_FDS) {
        int was_tun = fd_is_mosey_tun[fd];
        fd_is_sock_raw[fd] = 0;
        fd_is_mon_bound[fd] = 0;
        fd_is_mosey_tun[fd] = 0;
        if (was_tun) {
            pthread_mutex_lock(&io_lock);
            cleanup_mon_locked();
            pthread_mutex_unlock(&io_lock);
        }
    }
    return real_close(fd);
}

int dup(int oldfd) {
    ensure_init();
    int nfd = real_dup(oldfd);
    if (nfd >= 0 && nfd < MAX_TRACKED_FDS) {
        fd_is_sock_raw[nfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_sock_raw[oldfd] : 0;
        fd_is_mon_bound[nfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_mon_bound[oldfd] : 0;
        fd_is_mosey_tun[nfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_mosey_tun[oldfd] : 0;
    }
    return nfd;
}

int dup2(int oldfd, int newfd) {
    ensure_init();
    int rc = real_dup2(oldfd, newfd);
    if (rc >= 0 && newfd >= 0 && newfd < MAX_TRACKED_FDS) {
        fd_is_sock_raw[newfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_sock_raw[oldfd] : 0;
        fd_is_mon_bound[newfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_mon_bound[oldfd] : 0;
        fd_is_mosey_tun[newfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_mosey_tun[oldfd] : 0;
    }
    return rc;
}

int dup3(int oldfd, int newfd, int flags) {
    ensure_init();
    int rc = real_dup3(oldfd, newfd, flags);
    if (rc >= 0 && newfd >= 0 && newfd < MAX_TRACKED_FDS) {
        fd_is_sock_raw[newfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_sock_raw[oldfd] : 0;
        fd_is_mon_bound[newfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_mon_bound[oldfd] : 0;
        fd_is_mosey_tun[newfd] = (oldfd >= 0 && oldfd < MAX_TRACKED_FDS) ? fd_is_mosey_tun[oldfd] : 0;
    }
    return rc;
}

int ioctl(int fd, int request, ...) {
    ensure_init();
    va_list args;
    va_start(args, request);
    void *argp = va_arg(args, void *);
    va_end(args);

    unsigned int req = (unsigned int)request;
    if (req == IOCTL_ART_CMD) {
        return handle_art_ioctl((struct ifreq *)argp);
    }

    if (req == TUNSETIFF_IOCTL && argp && fd >= 0 && fd < MAX_TRACKED_FDS) {
        int rc = real_ioctl(fd, request, argp);
        if (rc == 0) {
            struct ifreq *ifr = (struct ifreq *)argp;
            if (strncmp(ifr->ifr_name, "mosey", 5) == 0) {
                fd_is_mosey_tun[fd] = 1;
            }
        }
        return rc;
    }

    if (argp && is_radiotap_ifname_input_ioctl(req)) {
        struct ifreq *ifr = (struct ifreq *)argp;
        int is_rt = (strncmp(ifr->ifr_name, "radiotap0", IFNAMSIZ) == 0);
        int is_w0 = (strncmp(ifr->ifr_name, "wlan0", IFNAMSIZ) == 0);
        if (is_rt || is_w0) {
            if (req == SIOCGIFHWADDR) {
                pthread_mutex_lock(&io_lock);
                ensure_mon_active_locked(0);
                pthread_mutex_unlock(&io_lock);
            }
            struct ifreq tmp;
            memcpy(&tmp, ifr, sizeof(tmp));
            if (is_rt) {
                memset(tmp.ifr_name, 0, IFNAMSIZ);
                memcpy(tmp.ifr_name, "wlan0", 6);
            }
            int rc = real_ioctl(fd, request, &tmp);
            if (rc == 0) {
                memcpy(ifr, &tmp, sizeof(tmp));
                if (is_rt) {
                    memset(ifr->ifr_name, 0, IFNAMSIZ);
                    memcpy(ifr->ifr_name, "radiotap0", 10);
                }
                if (req == SIOCGIFHWADDR) {
                    ifr->ifr_hwaddr.sa_family = ARPHRD_IEEE80211_RADIOTAP;
                }
            } else if (req == SIOCETHTOOL && tmp.ifr_data &&
                       *(uint32_t *)tmp.ifr_data == ETHTOOL_GET_TS_INFO) {
                struct ethtool_ts_info *ts = (struct ethtool_ts_info *)tmp.ifr_data;
                memset(ts, 0, sizeof(*ts));
                ts->cmd = ETHTOOL_GET_TS_INFO;
                ts->so_timestamping = SOF_TIMESTAMPING_RX_SOFTWARE |
                                      SOF_TIMESTAMPING_TX_SOFTWARE |
                                      SOF_TIMESTAMPING_SOFTWARE;
                ts->phc_index = -1;
                return 0;
            }
            return rc;
        }
    }

    return real_ioctl(fd, request, argp);
}

ssize_t send(int fd, const void *buf, size_t len, int flags) {
    ensure_init();
    if (fd >= 0 && fd < MAX_TRACKED_FDS && fd_is_mon_bound[fd]) {
        return handle_raw_tx(fd, buf, len);
    }
    return real_send(fd, buf, len, flags);
}

ssize_t sendto(int fd, const void *buf, size_t len, int flags,
               const struct sockaddr *dest_addr, socklen_t addrlen) {
    ensure_init();
    if (fd >= 0 && fd < MAX_TRACKED_FDS && fd_is_mon_bound[fd]) {
        return handle_raw_tx(fd, buf, len);
    }
    return real_sendto(fd, buf, len, flags, dest_addr, addrlen);
}

ssize_t sendmsg(int fd, const struct msghdr *msg, int flags) {
    ensure_init();
    if (fd >= 0 && fd < MAX_TRACKED_FDS && fd_is_mon_bound[fd] && msg && msg->msg_iovlen > 0) {
        uint8_t flat[4096];
        size_t off = 0;
        for (size_t i = 0; i < (size_t)msg->msg_iovlen; i++) {
            size_t ilen = msg->msg_iov[i].iov_len;
            if (off + ilen > sizeof(flat)) {
                errno = EMSGSIZE;
                return -1;
            }
            memcpy(flat + off, msg->msg_iov[i].iov_base, ilen);
            off += ilen;
        }
        return handle_raw_tx(fd, flat, off);
    }
    return real_sendmsg(fd, msg, flags);
}

ssize_t write(int fd, const void *buf, size_t count) {
    ensure_init();
    if (fd >= 0 && fd < MAX_TRACKED_FDS && fd_is_mon_bound[fd]) {
        return handle_raw_tx(fd, buf, count);
    }
    return real_write(fd, buf, count);
}
