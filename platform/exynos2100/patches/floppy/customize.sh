# [
KERNEL_OWNER="FlopKernel-Series"
KERNEL_NAME="flop_exynos2100_kernel"
KERNEL_REPO="https://github.com/$KERNEL_OWNER/$KERNEL_NAME"
KERNEL_API="https://api.github.com/repos/$KERNEL_OWNER/$KERNEL_NAME/releases"
KERNEL_VARIANT="KSUNext-SUSFS"
FALLBACK_TAG="flop-v1.1.2"
FALLBACK_ARCHIVE="Floppy_v1.1.2-KSUNext-SUSFS-exynos2100-20260530-1437.zip"

CURL_GH_ARGS=(-fsSL --retry 3 --retry-delay 2 --max-time 25)
if [ -n "${GITHUB_TOKEN:-}" ]; then
    CURL_GH_ARGS+=(-H "Authorization: Bearer $GITHUB_TOKEN")
fi

_FLOPPY_PARSE_RELEASE_JSON()
{
    local JSON_DATA="$1"
    local VARIANT="$2"

    [ -n "$JSON_DATA" ] || return 1

    if command -v python3 > /dev/null 2>&1; then
        printf '%s' "$JSON_DATA" | python3 -c '
import json, re, sys

variant = sys.argv[1]
try:
    data = json.load(sys.stdin)
except Exception:
    sys.exit(1)

tag = (data.get("tag_name") or "").strip()
pattern = re.compile(r"^Floppy_.*" + re.escape(variant) + r"-exynos2100-.*\.zip$")
matches = [
    a for a in (data.get("assets") or [])
    if isinstance(a, dict) and pattern.match(a.get("name") or "")
]
matches.sort(key=lambda a: a.get("name") or "")
best = matches[-1] if matches else {}
print("|".join([
    tag,
    (best.get("name") or "").strip(),
    (best.get("url") or "").strip(),
    (best.get("browser_download_url") or "").strip(),
]))
' "$VARIANT" 2> /dev/null
    else
        local TAG ARCHIVE
        TAG="$(printf '%s' "$JSON_DATA" | sed -n 's/.*"tag_name":[[:space:]]*"\([^"]*\)".*/\1/p' | head -n 1)"
        ARCHIVE="$(printf '%s' "$JSON_DATA" | grep -oE "Floppy_[^\"]+${VARIANT}-exynos2100-[^\"]+\.zip" | sort -u | tail -n 1 || true)"
        printf '%s|%s||\n' "$TAG" "$ARCHIVE"
    fi
}

LATEST_TAG=""
KERNEL_ARCHIVE=""
KERNEL_ASSET_API_URL=""
KERNEL_DOWNLOAD_URL=""

RELEASE_JSON="$(
    curl "${CURL_GH_ARGS[@]}" \
        -H "Accept: application/vnd.github+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        "$KERNEL_API/latest" 2> /dev/null || true
)"
if [ -n "$RELEASE_JSON" ]; then
    IFS='|' read -r LATEST_TAG KERNEL_ARCHIVE KERNEL_ASSET_API_URL KERNEL_DOWNLOAD_URL \
        <<< "$(_FLOPPY_PARSE_RELEASE_JSON "$RELEASE_JSON" "$KERNEL_VARIANT" || true)"
fi

if [ -z "$LATEST_TAG" ]; then
    LATEST_TAG="$(
        curl -fsSL --retry 3 --retry-delay 2 --max-time 25 "$KERNEL_REPO/releases.atom" 2> /dev/null \
        | grep -oE "/releases/tag/[^\"<[:space:]]+" \
        | sed 's|^/releases/tag/||' \
        | head -n 1 \
        || true
    )"
fi

if [ -z "$LATEST_TAG" ]; then
    LATEST_TAG="$(
        curl -fsSL --retry 3 --retry-delay 2 --max-time 25 -o /dev/null -w '%{url_effective}' "$KERNEL_REPO/releases/latest" 2> /dev/null \
        | sed -n 's|.*/releases/tag/\([^/?#[:space:]]*\).*|\1|p' \
        | tail -n 1 \
        || true
    )"
fi

if [ -z "$LATEST_TAG" ]; then
    LOGW "Failed to query latest FloppyKernel release tag; falling back to verified $FALLBACK_TAG"
    LATEST_TAG="$FALLBACK_TAG"
    KERNEL_ARCHIVE="$FALLBACK_ARCHIVE"
fi

if [ -z "$KERNEL_ARCHIVE" ]; then
    TAG_JSON="$(
        curl "${CURL_GH_ARGS[@]}" \
            -H "Accept: application/vnd.github+json" \
            -H "X-GitHub-Api-Version: 2022-11-28" \
            "$KERNEL_API/tags/$LATEST_TAG" 2> /dev/null || true
    )"
    if [ -n "$TAG_JSON" ]; then
        IFS='|' read -r _ KERNEL_ARCHIVE KERNEL_ASSET_API_URL KERNEL_DOWNLOAD_URL \
            <<< "$(_FLOPPY_PARSE_RELEASE_JSON "$TAG_JSON" "$KERNEL_VARIANT" || true)"
    fi
fi

if [ -z "$KERNEL_ARCHIVE" ]; then
    KERNEL_ARCHIVE="$(
        curl -fsSL --retry 3 --retry-delay 2 --max-time 25 "$KERNEL_REPO/releases/expanded_assets/$LATEST_TAG" 2> /dev/null \
        | grep -oE "Floppy_[^\"]+${KERNEL_VARIANT}-exynos2100-[^\"]+\.zip" \
        | sort -u \
        | tail -n 1 \
        || true
    )"
fi

if [ -z "$KERNEL_ARCHIVE" ]; then
    if [ "$LATEST_TAG" = "$FALLBACK_TAG" ]; then
        KERNEL_ARCHIVE="$FALLBACK_ARCHIVE"
    else
        LOGW "Failed to resolve FloppyKernel ($KERNEL_VARIANT) archive for $LATEST_TAG; falling back to verified $FALLBACK_TAG ($FALLBACK_ARCHIVE)"
        LATEST_TAG="$FALLBACK_TAG"
        KERNEL_ARCHIVE="$FALLBACK_ARCHIVE"
        KERNEL_ASSET_API_URL=""
        KERNEL_DOWNLOAD_URL=""
    fi
fi

if [ -z "$KERNEL_DOWNLOAD_URL" ]; then
    KERNEL_DOWNLOAD_URL="$KERNEL_REPO/releases/download/$LATEST_TAG/$KERNEL_ARCHIVE"
fi
# ]

if [ ! -f "$WORK_DIR/kernel/boot.img" ]; then
    ABORT "File not found: ${WORK_DIR//$SRC_DIR\//}/kernel/boot.img"
fi

if [[ -d "$TMP_DIR" ]]; then
    EVAL "rm -rf \"$TMP_DIR\""
fi
EVAL "mkdir -p \"$TMP_DIR\""

LOG_STEP_IN "- Downloading FloppyKernel ($LATEST_TAG $KERNEL_VARIANT)"
DOWNLOAD_FILE "$KERNEL_DOWNLOAD_URL" "$TMP_DIR/$KERNEL_ARCHIVE" || rm -f "$TMP_DIR/$KERNEL_ARCHIVE"
if ! unzip -tq "$TMP_DIR/$KERNEL_ARCHIVE" > /dev/null 2>&1; then
    rm -f "$TMP_DIR/$KERNEL_ARCHIVE"
    if [ -n "$KERNEL_ASSET_API_URL" ]; then
        curl "${CURL_GH_ARGS[@]}" -H "Accept: application/octet-stream" -o "$TMP_DIR/$KERNEL_ARCHIVE" "$KERNEL_ASSET_API_URL" || true
    fi
fi
if ! unzip -tq "$TMP_DIR/$KERNEL_ARCHIVE" > /dev/null 2>&1; then
    ABORT "Failed to download valid FloppyKernel archive ($KERNEL_ARCHIVE)"
fi

LOG "- Extracting kernel artifacts"
EVAL "unzip -o \"$TMP_DIR/$KERNEL_ARCHIVE\" \"Image\" \"vendor_boot.img\" -d \"$TMP_DIR\"" || exit 1

if [ ! -f "$TMP_DIR/Image" ] || [ ! -f "$TMP_DIR/vendor_boot.img" ]; then
    ABORT "Required kernel images missing from $KERNEL_ARCHIVE"
fi

if [[ "$(READ_BYTES_AT "$TMP_DIR/Image" "0" "2")" == "8b1f" ]]; then
    LOG "- Decompressing kernel Image"
    EVAL "cat \"$TMP_DIR/Image\" | gzip -d > \"$TMP_DIR/Image.tmp\" && mv -f \"$TMP_DIR/Image.tmp\" \"$TMP_DIR/Image\"" || exit 1
fi

if [[ "$(LC_ALL=C file -b "$TMP_DIR/Image")" != "Linux kernel ARM64"* ]]; then
    ABORT "Kernel image not valid\n\n$(LC_ALL=C file -b "$TMP_DIR/Image")"
fi

# Enable full uname BPF spoofing (5.10.200) for Android 16+ (SDK >= 36), matching AnyKernel3 bpf_spoof.conf
if [ "${TARGET_PLATFORM_SDK_VERSION:-0}" -ge "36" ]; then
    if grep -q -F -a "uname_bpf_spoof=0" "$TMP_DIR/Image"; then
        LOG "- Enabling full uname BPF spoof in kernel Image"
        HEX_PATCH "$TMP_DIR/Image" \
            "756e616d655f6270665f73706f6f663d30" \
            "756e616d655f6270665f73706f6f663d32" || exit 1
    elif grep -q -F -a "uname_bpf_spoof=2" "$TMP_DIR/Image"; then
        LOG "- Full uname BPF spoof already enabled in kernel Image"
    else
        LOG "\033[0;33m! uname_bpf_spoof marker not found in kernel Image\033[0m"
    fi
fi

LOG "- Unpacking boot.img"
EVAL "cp -a \"$WORK_DIR/kernel/boot.img\" \"$TMP_DIR/boot.img\""
if ! MKBOOTIMG_ARGS="$(unpack_bootimg --boot_img "$TMP_DIR/boot.img" --out "$TMP_DIR/boot" --format mkbootimg 2>&1)"; then
    ABORT "Failed to extract boot.img\n\n$MKBOOTIMG_ARGS"
fi
EVAL "rm -f \"$TMP_DIR/boot.img\""

LOG "- Replacing kernel image in boot.img"
EVAL "mv -f \"$TMP_DIR/Image\" \"$TMP_DIR/boot/kernel\""

LOG "- Repacking boot.img"
EVAL "mkbootimg $MKBOOTIMG_ARGS -o \"$TMP_DIR/new-boot.img\"" || exit 1
echo -n "SEANDROIDENFORCE" >> "$TMP_DIR/new-boot.img"
EVAL "mv -f \"$TMP_DIR/new-boot.img\" \"$WORK_DIR/kernel/boot.img\""

LOG "- Replacing vendor_boot.img"
EVAL "mv -f \"$TMP_DIR/vendor_boot.img\" \"$WORK_DIR/kernel/vendor_boot.img\""

# Newer FloppyKernel builds include per-device dtbo_<codename>.img
if unzip -l "$TMP_DIR/$KERNEL_ARCHIVE" | grep -qE "[[:space:]]dtbo_${TARGET_CODENAME}\.img$"; then
    LOG "- Replacing dtbo.img (dtbo_${TARGET_CODENAME}.img)"
    EVAL "unzip -o \"$TMP_DIR/$KERNEL_ARCHIVE\" \"dtbo_${TARGET_CODENAME}.img\" -d \"$TMP_DIR\"" || exit 1
    EVAL "mv -f \"$TMP_DIR/dtbo_${TARGET_CODENAME}.img\" \"$WORK_DIR/kernel/dtbo.img\""
elif unzip -l "$TMP_DIR/$KERNEL_ARCHIVE" | grep -qE "[[:space:]]dtbo\.img$"; then
    LOG "- Replacing dtbo.img"
    EVAL "unzip -o \"$TMP_DIR/$KERNEL_ARCHIVE\" \"dtbo.img\" -d \"$TMP_DIR\"" || exit 1
    EVAL "mv -f \"$TMP_DIR/dtbo.img\" \"$WORK_DIR/kernel/dtbo.img\""
else
    LOG "- Keeping stock dtbo.img (not bundled in $KERNEL_ARCHIVE)"
fi

EVAL "rm -rf \"$TMP_DIR\""

LOG_STEP_OUT

unset KERNEL_REPO KERNEL_VARIANT LATEST_TAG KERNEL_ARCHIVE MKBOOTIMG_ARGS

