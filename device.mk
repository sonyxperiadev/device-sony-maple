# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Device path
DEVICE_PATH := device/sony/maple

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# Sensors Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/etc/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Thermal Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/etc/thermanager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermanager.xml

# Camera Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/etc/camera/camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config.xml \
    $(DEVICE_PATH)/rootdir/vendor/etc/camera/imx258_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_chromatix.xml \
    $(DEVICE_PATH)/rootdir/vendor/etc/camera/imx400_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx400_chromatix.xml

# Audio calibration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/etc/acdbdata/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Bluetooth_cal.acdb \
    $(DEVICE_PATH)/rootdir/vendor/etc/acdbdata/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/General_cal.acdb \
    $(DEVICE_PATH)/rootdir/vendor/etc/acdbdata/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Global_cal.acdb \
    $(DEVICE_PATH)/rootdir/vendor/etc/acdbdata/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Handset_cal.acdb \
    $(DEVICE_PATH)/rootdir/vendor/etc/acdbdata/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Hdmi_cal.acdb \
    $(DEVICE_PATH)/rootdir/vendor/etc/acdbdata/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Headset_cal.acdb \
    $(DEVICE_PATH)/rootdir/vendor/etc/acdbdata/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Speaker_cal.acdb

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# BT/Wifi patch file
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/firmware/wlan/qca_cld/bdwlan.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/bdwlan.bin

# Device Init
PRODUCT_PACKAGES += \
    fstab.maple \
    init.recovery.maple \
    init.maple \
    ueventd.maple

# Lights
PRODUCT_PACKAGES += \
    lights.maple

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.maple

# Fingerprint HAL
PRODUCT_PACKAGES += \
    fingerprintd \
    fingerprint.maple

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.maple

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=480 \
    ro.usb.pid_suffix=1F1

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/yoshino/platform.mk)

# copy NFC firmware
$(call inherit-product-if-exists, vendor/nxp/nxp-vendor.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/sony/yoshino-common/yoshino-partial.mk)

# include optional vendor configuration
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/build/qcom-packages.mk)
