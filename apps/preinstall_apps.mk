PRODUCT_PACKAGES += \
    preinstall_app.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/apps/preinstall_app.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/preinstall_app.sh \
    $(LOCAL_DIR)/apps/SogouInput/SogouInput_11.50_android_sweb.apk:$(TARGET_COPY_OUT_SYSTEM)/preinstall/SogouInput.apk
