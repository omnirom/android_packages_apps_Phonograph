#
# Copyright (C) 2008 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_STATIC_ANDROID_LIBRARIES := \
    $(ANDROID_SUPPORT_DESIGN_TARGETS) \
    android-support-v7-preference \
    android-support-compat \
    android-support-core-utils \
    android-support-core-ui \
    android-support-media-compat \
    android-support-fragment \
    android-support-v14-preference \
    android-support-v7-palette \
    android-support-v7-appcompat \
    android-support-v7-gridlayout \
    android-support-v7-cardview \
    android-support-v7-recyclerview \
    android-support-v13 \
    android-support-annotations \
    android-support-vectordrawable \
    android-support-animatedvectordrawable \
    android-support-percent \
    android-support-transition

LOCAL_STATIC_JAVA_LIBRARIES := \
    android-observablescrollview-target \
    retrofit-target \
    converter-gson-target \
    anjlab-library-target \
    glide-local-target \
    okhttp3-target \
    okhttp3-integration-target \
    okio-sink-target \
    advrecycler-view-target \
    jaudiotagger-target \
    gson-local-target \
    logging-interceptor-target

# AAR libraries
LOCAL_STATIC_ANDROID_LIBRARIES += app-theme-helper-target \
    material-dialogs-core-target \
    material-dialogs-commons-target \
    material-cab-target \
    SeekArc-target \
    AndroidSlidingUpPanel-target \
    licensesdialog-target \
    RecyclerView-FastScroll-target \
    material-intro-target \
    material-progressbar-library-target

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res
# LOCAL_RESOURCE_DIR += $(foreach lib, $(LOCAL_STATIC_JAVA_AAR_LIBRARIES),\
#  $(call intermediates-dir-for,JAVA_LIBRARIES,$(lib),,COMMON)/aar/res)

LOCAL_USE_AAPT2 := true
LOCAL_PROGUARD_ENABLED := disabled
LOCAL_JAR_EXCLUDE_FILES := none
LOCAL_SRC_FILES += $(call all-java-files-under, java)
LOCAL_PACKAGE_NAME := Phonograph
LOCAL_SDK_VERSION := current
LOCAL_MODULE_TAGS := optional
LOCAL_MIN_SDK_VERSION := 24
#LOCAL_DEX_PREOPT := false
include $(BUILD_PACKAGE)

# Enumerate target prebuilts to avoid linker warnings

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := android-observablescrollview-target
LOCAL_SRC_FILES := libs/android-observablescrollview-1.6.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := retrofit-target
LOCAL_SRC_FILES := libs/retrofit-2.2.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := converter-gson-target
LOCAL_SRC_FILES := libs/converter-gson-2.2.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := anjlab-library-target
LOCAL_SRC_FILES := libs/anjlab-library-2.4.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := glide-local-target
LOCAL_SRC_FILES := libs/glide-3.7.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := okhttp3-target
LOCAL_SRC_FILES := libs/okhttp-3.3.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := logging-interceptor-target
LOCAL_SRC_FILES := libs/logging-interceptor-3.3.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := okhttp3-integration-target
LOCAL_SRC_FILES := libs/okhttp3-integration-1.4.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := okio-sink-target
LOCAL_SRC_FILES := libs/okio-1.8.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := advrecycler-view-target
LOCAL_SRC_FILES := libs/advrecyclerview-0.10.0.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := jaudiotagger-target
LOCAL_SRC_FILES := libs/jaudiotagger-android-2.2.3.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := gson-local-target
LOCAL_SRC_FILES := libs/gson-2.7.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)
