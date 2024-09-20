LOCAL_PATH:= $(call my-dir)

ifneq ($(filter f1s, $(TARGET_DEVICE)),)

include $(call first-makefiles-under,$(LOCAL_PATH))

endif
