$(call inherit-product, device/meizu/m3_m3s-common/device-common.mk)
$(call inherit-product-if-exists, vendor/meizu/m3s/m3s-vendor.mk)

LOCAL_PATH := device/oppo/f1s

TARGET_OTA_ASSERT_DEVICE := f1s
LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel

# BT A2DP
PRODUCT_COPY_FILES += \
    vendor/oppo/f1s/proprietary/vendor/lib/hw/audio.a2dp.blueangel.so:system/vendor/lib/hw/audio.a2dp.mt6750.so
