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
    gson-local-target

LOCAL_STATIC_JAVA_AAR_LIBRARIES := app-theme-helper-target \
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
LOCAL_RESOURCE_DIR += $(foreach lib, $(LOCAL_STATIC_JAVA_AAR_LIBRARIES),\
  $(call intermediates-dir-for,JAVA_LIBRARIES,$(lib),,COMMON)/aar/res)

LOCAL_AAPT_FLAGS := --auto-add-overlay \
    --extra-packages com.afollestad.materialdialogs \
    --extra-packages com.afollestad.materialdialogs.commons \
    --extra-packages com.afollestad.materialcab \
    --extra-packages com.heinrichreimersoftware.materialintro \
    --extra-packages com.simplecityapps.recyclerview_fastscroll \
    --extra-packages com.sothree.slidinguppanel.library \
    --extra-packages me.zhanghai.android.materialprogressbar \
    --extra-packages de.psdev.licensesdialog \
    --extra-packages com.triggertrap.seekarc \
    --extra-packages com.kabouzeid.appthemehelper

LOCAL_USE_AAPT2 := true
LOCAL_PROGUARD_ENABLED := disabled
LOCAL_JAR_EXCLUDE_FILES := none
LOCAL_SRC_FILES += $(call all-java-files-under, java)
LOCAL_PACKAGE_NAME := Phonograph
LOCAL_SDK_VERSION := current
LOCAL_MODULE_TAGS := optional
include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
    app-theme-helper:libs/aar/app-theme-helper-1.3.4.aar \
    material-dialogs-core:libs/aar/material-dialogs-core-0.9.4.2.aar \
    material-dialogs-commons:libs/aar/material-dialogs-commons-0.9.4.2.aar \
    material-cab:libs/aar/material-cab-0.1.12.aar \
    SeekArc:libs/aar/SeekArc-1.2-kmod.aar \
    AndroidSlidingUpPanel:libs/aar/AndroidSlidingUpPanel-3.3.0-kmod3.aar \
    licensesdialog:libs/aar/licensesdialog-1.8.1.aar \
    RecyclerView-FastScroll:libs/aar/RecyclerView-FastScroll-1.9-kmod.aar \
    material-intro:libs/aar/material-intro-1.6.aar \
    material-progressbar-library:libs/aar/material-progressbar-library-1.3.0.aar \
    android-observablescrollview:libs/android-observablescrollview-1.6.0.jar \
    retrofit:libs/retrofit-2.2.0.jar \
    converter-gson:libs/converter-gson-2.2.0.jar \
    anjlab-library:libs/anjlab-library-2.4.0.jar \
    glide-local:libs/glide-3.7.0.jar \
    okhttp3:libs/okhttp-3.3.0.jar \
    okhttp3-integration:libs/okhttp3-integration-1.4.0.jar \
    okio-sink:libs/okio-1.8.0.jar \
    advrecycler-view:libs/advrecyclerview-0.10.0.jar \
    jaudiotagger:libs/jaudiotagger-android-2.2.3.jar \
    gson-local:libs/gson-2.7.jar

include $(BUILD_MULTI_PREBUILT)

# Enumerate target prebuilts to avoid linker warnings
include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := app-theme-helper-target
LOCAL_SRC_FILES := libs/aar/app-theme-helper-1.3.4.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := material-dialogs-core-target
LOCAL_SRC_FILES := libs/aar/material-dialogs-core-0.9.4.2.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := material-dialogs-commons-target
LOCAL_SRC_FILES := libs/aar/material-dialogs-commons-0.9.4.2.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := material-cab-target
LOCAL_SRC_FILES := libs/aar/material-cab-0.1.12.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := SeekArc-target
LOCAL_SRC_FILES := libs/aar/SeekArc-1.2-kmod.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := AndroidSlidingUpPanel-target
LOCAL_SRC_FILES := libs/aar/AndroidSlidingUpPanel-3.3.0-kmod3.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := licensesdialog-target
LOCAL_SRC_FILES := libs/aar/licensesdialog-1.8.1.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := RecyclerView-FastScroll-target
LOCAL_SRC_FILES := libs/aar/RecyclerView-FastScroll-1.9-kmod.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := material-intro-target
LOCAL_SRC_FILES := libs/aar/material-intro-1.6.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := material-progressbar-library-target
LOCAL_SRC_FILES := libs/aar/material-progressbar-library-1.3.0.aar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current

include $(BUILD_PREBUILT)

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
