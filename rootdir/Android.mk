LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := fstab.maple
LOCAL_SRC_FILES := vendor/etc/fstab.maple
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := fstab.maple
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)
