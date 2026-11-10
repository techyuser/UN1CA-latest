# [
KERNEL_REPO="https://github.com/FlopKernel-Series/flop_exynos2100_kernel"
KERNEL_VARIANT="KSUNext-SUSFS"

LATEST_TAG="$(
    curl -fsI "$KERNEL_REPO/releases/latest" 2> /dev/null \
    | tr -d '\r' \
    | sed -n 's/^[Ll]ocation:.*\/tag\/\([^[:space:]]*\).*/\1/p' \
    | tail -n 1 \
    || true
)"
if [ ! "$LATEST_TAG" ]; then
    ABORT "Failed to fetch latest FloppyKernel release tag"
fi

KERNEL_ARCHIVE="$(
    curl -fsL "$KERNEL_REPO/releases/expanded_assets/$LATEST_TAG" 2> /dev/null \
    | grep -oE "Floppy_[^\"]+${KERNEL_VARIANT}-exynos2100-[^\"]+\.zip" \
    | sort -u \
    | tail -n 1 \
    || true
)"
if [ ! "$KERNEL_ARCHIVE" ]; then
    ABORT "Failed to resolve FloppyKernel ($KERNEL_VARIANT) archive for $LATEST_TAG"
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
DOWNLOAD_FILE "$KERNEL_REPO/releases/download/$LATEST_TAG/$KERNEL_ARCHIVE" "$TMP_DIR/$KERNEL_ARCHIVE" || exit 1

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

