LOCAL_PATH := device/oppo/f1s

# Inherit from the proprietary version
-include vendor/oppo/A37/BoardConfigVendor.mk

# Prebuilt kernel image
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel

# system.prop
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Radio
ADD_RADIO_FILES := true
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
