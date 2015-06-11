#
# Copyright (C) 2014 The CyanogenMod Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)


# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    ueventd.qcom.rc

# Recovery
PRODUCT_PACKAGES += \
    chargeled \
    init.rc \
    init.recovery.qcom.rc \
    offmode_charging_res_images \
    dt.img \
    detect_key
    

$(call inherit-product, build/target/product/full.mk)

#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
