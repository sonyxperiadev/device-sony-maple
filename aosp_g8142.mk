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

# DualSim
BOARD_MULTI_SIM := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/maple/aosp_g8141.mk)

PRODUCT_NAME := aosp_g8142
PRODUCT_DEVICE := maple
PRODUCT_MODEL := Xperia XZ Premium Dual (AOSP)
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
