#define _GNU_SOURCE
#include <arpa/inet.h>
#include <errno.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <net/if.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <time.h>
#include <unistd.h>

#define WLC_IOCTL_MAGIC   0x14e46c77u
#define WLC_GET_VERSION   1
#define WLC_UP            2
#define WLC_GET_MONITOR   107
#define WLC_SET_MONITOR   108
#define WLC_GET_VAR       262
#define WLC_SET_VAR       263
#define NEX_INJECT_FRAME  408
#define NEX_GET_VER_STR   0x600
#define NEX_SET_MON_613   0x613

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

static int wl_ioctl(const char *ifname, uint32_t cmd, void *buf, uint32_t len, uint8_t set) {
    struct ifreq ifr;
    struct nex_ioctl ioc;
    int s = socket(AF_INET, SOCK_DGRAM, 0);
    if (s < 0) return -1;
    memset(&ifr, 0, sizeof(ifr));
    snprintf(ifr.ifr_name, IFNAMSIZ, "%s", ifname);
    memset(&ioc, 0, sizeof(ioc));
    ioc.cmd = cmd;
    ioc.buf = buf;
    ioc.len = len;
    ioc.set = set;
    ioc.driver = WLC_IOCTL_MAGIC;
    ifr.ifr_data = &ioc;
    int rc = ioctl(s, SIOCDEVPRIVATE, &ifr);
    int saved = errno;
    close(s);
    errno = saved;
    return rc;
}

static int wl_iovar_set_int(const char *ifname, const char *name, uint32_t val) {
    char buf[64];
    size_t nlen = strlen(name) + 1;
    if (nlen + sizeof(uint32_t) > sizeof(buf)) return -1;
    memset(buf, 0, sizeof(buf));
    memcpy(buf, name, nlen);
    memcpy(buf + nlen, &val, sizeof(uint32_t));
    return wl_ioctl(ifname, WLC_SET_VAR, buf, (uint32_t)(nlen + sizeof(uint32_t)), 1);
}

static int iface_up(const char *ifname, uint8_t mac_out[6]) {
    struct ifreq ifr;
    int s = socket(AF_INET, SOCK_DGRAM, 0);
    if (s < 0) return -1;
    memset(&ifr, 0, sizeof(ifr));
    snprintf(ifr.ifr_name, IFNAMSIZ, "%s", ifname);
    if (ioctl(s, SIOCGIFFLAGS, &ifr) == 0) {
        ifr.ifr_flags |= IFF_UP | IFF_RUNNING;
        if (ioctl(s, SIOCSIFFLAGS, &ifr) < 0) {
            perror("SIOCSIFFLAGS");
        }
    }
    if (mac_out) {
        memset(&ifr, 0, sizeof(ifr));
        snprintf(ifr.ifr_name, IFNAMSIZ, "%s", ifname);
        if (ioctl(s, SIOCGIFHWADDR, &ifr) == 0) {
            memcpy(mac_out, ifr.ifr_hwaddr.sa_data, 6);
        }
    }
    close(s);
    return 0;
}

static uint64_t mono_us(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000ULL + (uint64_t)(ts.tv_nsec / 1000ULL);
}

static int cmd_info(const char *ifname) {
    char ver[256];
    uint32_t mon = 0;
    uint16_t cs = 0;
    uint8_t mac[6] = {0};
    iface_up(ifname, mac);
    printf("MAC: %02x:%02x:%02x:%02x:%02x:%02x\n",
           mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
    memset(ver, 0, sizeof(ver));
    if (wl_ioctl(ifname, NEX_GET_VER_STR, ver, sizeof(ver) - 1, 0) == 0) {
        printf("Nexmon 0x600: %s\n", ver);
    } else {
        printf("Nexmon 0x600 err=%d (%s)\n", errno, strerror(errno));
    }
    if (wl_ioctl(ifname, WLC_GET_MONITOR, &mon, sizeof(mon), 0) == 0) {
        printf("WLC_GET_MONITOR: %u\n", mon);
    } else {
        printf("WLC_GET_MONITOR err=%d (%s)\n", errno, strerror(errno));
    }
    char cbuf[16];
    memset(cbuf, 0, sizeof(cbuf));
    strcpy(cbuf, "chanspec");
    if (wl_ioctl(ifname, WLC_GET_VAR, cbuf, 9, 0) == 0) {
        memcpy(&cs, cbuf, sizeof(cs));
        printf("chanspec: 0x%04x\n", cs);
    }
    return 0;
}

static int cmd_mon(const char *ifname, const char *cs_str, uint32_t mode) {
    uint16_t cs = wf_chspec_aton(cs_str);
    if (cs == 0) {
        fprintf(stderr, "Invalid chanspec: %s\n", cs_str);
        return 1;
    }
    iface_up(ifname, NULL);
    wl_iovar_set_int(ifname, "mpc", 0);
    wl_iovar_set_int(ifname, "scansuppress", 1);
    uint64_t t0 = mono_us();
    int rc1 = wl_iovar_set_int(ifname, "chanspec", (uint32_t)cs);
    uint64_t t1 = mono_us();
    int rc2 = wl_ioctl(ifname, NEX_SET_MON_613, &mode, sizeof(mode), 1);
    uint64_t t2 = mono_us();
    uint32_t got_mon = 0;
    wl_ioctl(ifname, WLC_GET_MONITOR, &got_mon, sizeof(got_mon), 0);
    printf("set_mon(%s -> 0x%04x, mode=%u): chanspec_rc=%d (%lluus), 0x613_rc=%d (%lluus), readback=%u\n",
           cs_str, cs, mode, rc1, (unsigned long long)(t1 - t0), rc2, (unsigned long long)(t2 - t1), got_mon);
    return (rc1 == 0 && rc2 == 0) ? 0 : 1;
}

static int cmd_sniff(const char *ifname, const char *cs_str, int seconds) {
    if (cmd_mon(ifname, cs_str, 2) != 0) return 1;
    int s = socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
    if (s < 0) {
        perror("socket(AF_PACKET)");
        return 1;
    }
    struct sockaddr_ll sll;
    memset(&sll, 0, sizeof(sll));
    sll.sll_family = AF_PACKET;
    sll.sll_protocol = htons(ETH_P_ALL);
    sll.sll_ifindex = (int)if_nametoindex(ifname);
    if (sll.sll_ifindex <= 0) {
        perror("if_nametoindex");
        close(s);
        return 1;
    }
    if (bind(s, (struct sockaddr *)&sll, sizeof(sll)) < 0) {
        perror("bind(AF_PACKET)");
        close(s);
        return 1;
    }
    struct timeval tv = {.tv_sec = 0, .tv_usec = 200000};
    setsockopt(s, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));

    uint8_t buf[4096];
    int total = 0, mgmt = 0, awdl = 0;
    uint64_t deadline = mono_us() + (uint64_t)seconds * 1000000ULL;
    while (mono_us() < deadline) {
        ssize_t n = recv(s, buf, sizeof(buf), 0);
        if (n <= 0) continue;
        total++;
        if (n < 8 || buf[0] != 0) continue;
        uint16_t rt_len = (uint16_t)(buf[2] | (buf[3] << 8));
        if (rt_len + 24 > (size_t)n) continue;
        const uint8_t *dot11 = buf + rt_len;
        uint8_t fc0 = dot11[0];
        uint8_t ftype = (fc0 >> 2) & 0x3;
        uint8_t fsub = (fc0 >> 4) & 0xf;
        if (ftype == 0) mgmt++;
        int is_awdl = 0;
        if (ftype == 0 && fsub == 0x0d && rt_len + 28 <= (size_t)n) {
            if (dot11[24] == 0x7f && dot11[25] == 0x00 && dot11[26] == 0x17 && dot11[27] == 0xf2) {
                is_awdl = 1;
                awdl++;
            }
        }
        if (total <= 12 || is_awdl) {
            printf("RX #%d len=%zd rt=%u type=%u sub=%u src=%02x:%02x:%02x:%02x:%02x:%02x dst=%02x:%02x:%02x:%02x:%02x:%02x%s\n",
                   total, n, rt_len, ftype, fsub,
                   dot11[10], dot11[11], dot11[12], dot11[13], dot11[14], dot11[15],
                   dot11[4], dot11[5], dot11[6], dot11[7], dot11[8], dot11[9],
                   is_awdl ? " [AWDL]" : "");
        }
    }
    close(s);
    printf("SNIFF_DONE total=%d mgmt=%d awdl=%d\n", total, mgmt, awdl);
    return 0;
}

static int cmd_tx(const char *ifname, const char *cs_str, int count) {
    uint8_t mac[6] = {0};
    iface_up(ifname, mac);
    if (cmd_mon(ifname, cs_str, 2) != 0) return 1;

    uint8_t pkt_buf[256];
    struct inject_frame *frm = (struct inject_frame *)pkt_buf;
    static const uint8_t dummy_rt[8] = {0, 0, 8, 0, 0, 0, 0, 0};
    /* Minimal valid 802.11 Probe Request frame (24B hdr + empty SSID IE) */
    uint8_t dot11[26];
    memset(dot11, 0, sizeof(dot11));
    dot11[0] = 0x40; /* Probe Request */
    dot11[1] = 0x00;
    memset(&dot11[4], 0xff, 6); /* DA: broadcast */
    memcpy(&dot11[10], mac, 6); /* SA */
    memset(&dot11[16], 0xff, 6); /* BSSID */
    dot11[24] = 0x00; /* SSID tag */
    dot11[25] = 0x00; /* length 0 (wildcard) */

    size_t payload_len = sizeof(dummy_rt) + sizeof(dot11);
    frm->len = (uint16_t)(payload_len + sizeof(*frm));
    frm->pad = 0;
    frm->type = 1; /* Radiotap included */
    memcpy(frm->data, dummy_rt, sizeof(dummy_rt));
    memcpy(frm->data + sizeof(dummy_rt), dot11, sizeof(dot11));

    int ok = 0;
    uint64_t t0 = mono_us();
    for (int i = 0; i < count; i++) {
        dot11[22] = (uint8_t)((i & 0xf) << 4);
        dot11[23] = (uint8_t)(i >> 4);
        memcpy(frm->data + sizeof(dummy_rt) + 22, &dot11[22], 2);
        if (wl_ioctl(ifname, NEX_INJECT_FRAME, frm, frm->len, 1) == 0) {
            ok++;
        } else {
            fprintf(stderr, "inject #%d failed errno=%d (%s)\n", i, errno, strerror(errno));
            break;
        }
        usleep(5000);
    }
    uint64_t t1 = mono_us();
    printf("TX_DONE ok=%d/%d elapsed=%lluus\n", ok, count, (unsigned long long)(t1 - t0));
    return (ok == count) ? 0 : 1;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s info | mon <chanspec> [2|0] | sniff <chanspec> <sec> | tx <chanspec> <count>\n", argv[0]);
        return 1;
    }
    const char *ifname = "wlan0";
    if (strcmp(argv[1], "info") == 0) return cmd_info(ifname);
    if (strcmp(argv[1], "mon") == 0 && argc >= 3) {
        uint32_t mode = (argc >= 4) ? (uint32_t)atoi(argv[3]) : 2u;
        return cmd_mon(ifname, argv[2], mode);
    }
    if (strcmp(argv[1], "sniff") == 0 && argc >= 4) {
        return cmd_sniff(ifname, argv[2], atoi(argv[3]));
    }
    if (strcmp(argv[1], "tx") == 0 && argc >= 4) {
        return cmd_tx(ifname, argv[2], atoi(argv[3]));
    }
    fprintf(stderr, "Unknown/invalid args\n");
    return 1;
}
