#
# Copyright (C) 2012 The Android Open-Source Project
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

#$(error $(TARGET_DEVICE))

LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE		:= chargeled
LOCAL_MODULE_TAGS	:= optional eng
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= sbin/chargeled
LOCAL_MODULE_PATH	:= $(TARGET_ROOT_OUT)/sbin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= detect_key
LOCAL_MODULE_TAGS	:= optional eng
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= sbin/detect_key
LOCAL_MODULE_PATH	:= $(TARGET_ROOT_OUT)/sbin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= offmode_charging
LOCAL_MODULE_TAGS	:= optional eng
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= sbin/offmode_charging
LOCAL_MODULE_PATH	:= $(TARGET_ROOT_OUT)/sbin
include $(BUILD_PREBUILT)


define _add-offmode_charging-image
include $$(CLEAR_VARS)
LOCAL_MODULE := offmode_charging_$(notdir $(1))
LOCAL_MODULE_STEM := $(notdir $(1))
_img_modules += $$(LOCAL_MODULE)
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $$(TARGET_RECOVERY_ROOT_OUT)/res/offmode_charging_images
include $$(BUILD_PREBUILT)
endef

_img_modules :=
$(foreach _img, $(call find-subdir-subdir-files, "res/offmode_charging_images", "*.png"), \
  $(eval $(call _add-offmode_charging-image,$(_img))))

include $(CLEAR_VARS)
LOCAL_MODULE := offmode_charging_res_images
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(_img_modules)
include $(BUILD_PHONY_PACKAGE)

_add-offmode_charging-image :=
_img_modules :=

include $(CLEAR_VARS)
LOCAL_MODULE		:= init.recovery.qcom.rc
LOCAL_MODULE_TAGS	:= optional eng
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= etc/init.recovery.qcom.rc
LOCAL_MODULE_PATH	:= $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE		:= dt.img
LOCAL_MODULE_TAGS	:= optional eng
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= dt.img
LOCAL_MODULE_PATH	:= $(PRODUCT_OUT)
include $(BUILD_PREBUILT)

