LOG "- Patching SBWC compression for Vulkan compatibility in /vendor/build.prop"

EVAL "if grep -q '^vendor.debug.c2.sbwc.enable=' \"$WORK_DIR/vendor/build.prop\"; then \
        sed -i 's/^vendor.debug.c2.sbwc.enable=.*/vendor.debug.c2.sbwc.enable=false/g' \"$WORK_DIR/vendor/build.prop\"; \
      else \
        echo 'vendor.debug.c2.sbwc.enable=false' >> \"$WORK_DIR/vendor/build.prop\"; \
      fi"

if [[ "$(GET_PROP "ro.hwui.use_vulkan")" != "true" ]]; then
    LOG "- Enabling Vulkan HWUI renderer by default"
    SET_PROP "system" "persist.sys.unica.vulkan" "true"
fi
