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

include device/sony/yoshino/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := yoshino

# Platform
PRODUCT_PLATFORM := yoshino

# NFC
NXP_CHIP_TYPE := PN553
NXP_CHIP_FW_TYPE := PN553

BOARD_KERNEL_CMDLINE += androidboot.hardware=maple

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_CACHEIMAGE_PARTITION_SIZE := 398458880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 7707033600
# Reserve space for data encryption (54587760640-32768)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 54587727872

# For split frame buffer in recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_OVERLAY_ENABLE := true
TARGET_RECOVERY_OVERLAY_ENABLE_DOUBLE_BUFFERING := false

# Device witout a vendor partition
TARGET_COPY_OUT_VENDOR := system/vendor

BOARD_ROOT_EXTRA_SYMLINKS := /system/vendor/lib/dsp:/dsp

#TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/clearpad/wakeup_gesture"
