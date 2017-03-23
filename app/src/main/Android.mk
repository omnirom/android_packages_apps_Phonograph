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

ifeq ($(TARGET_BUILD_APPS),)
support_library_root_dir := frameworks/support
else
support_library_root_dir := prebuilts/sdk/current/support
endif

LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-preference \
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
    android-support-annotations \
    android-support-vectordrawable \
    android-support-animatedvectordrawable \
    android-support-design \
    android-support-percent \
    android-support-transition \
    android-observablescrollview \
    retrofit \
    converter-gson \
    anjlab-library \
    glide-local \
    okhttp3 \
    okhttp3-integration \
    okio-sink \
    advrecycler-view \
    jaudiotagger \
    gson


LOCAL_STATIC_JAVA_AAR_LIBRARIES += app-theme-helper \
    material-dialogs-core \
    material-dialogs-commons \
    material-cab \
    SeekArc \
    AndroidSlidingUpPanel \
    licensesdialog \
    RecyclerView-FastScroll \
    material-intro

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res \
                      $(support_library_root_dir)/v14/preference/res \
                      $(support_library_root_dir)/v7/preference/res \
                      $(support_library_root_dir)/v7/appcompat/res \
                      $(support_library_root_dir)/v7/recyclerview/res \
                      $(support_library_root_dir)/v7/gridlayout/res \
                      $(support_library_root_dir)/v7/cardview/res \
                      $(support_library_root_dir)/transition/res \
                      $(support_library_root_dir)/percent/res \
                      $(support_library_root_dir)/design/res

LOCAL_AAPT_FLAGS := --auto-add-overlay \
    --extra-packages android.support.v14.preference \
    --extra-packages android.support.v7.preference \
    --extra-packages android.support.v7.appcompat \
    --extra-packages android.support.v7.recyclerview \
    --extra-packages android.support.v7.gridlayout \
    --extra-packages android.support.v7.cardview \
    --extra-packages android.support.transition \
    --extra-packages android.support.percent \
    --extra-packages android.support.design \
    --extra-packages com.afollestad.materialdialogs \
    --extra-packages com.afollestad.materialdialogs.commons \
    --extra-packages com.afollestad.materialcab \
    --extra-packages com.heinrichreimersoftware.materialintro \
    --extra-packages com.simplecityapps.recyclerview_fastscroll \
    --extra-packages com.sothree.slidinguppanel.library \
    --extra-packages de.psdev.licensesdialog \
    --extra-packages com.triggertrap.seekarc \
    --extra-packages com.kabouzeid.appthemehelper

LOCAL_PROGUARD_FLAG_FILES := proguard-rules.pro
LOCAL_JAR_EXCLUDE_FILES := none
LOCAL_SRC_FILES += $(call all-java-files-under, java)
LOCAL_PACKAGE_NAME := Phonograph
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
    app-theme-helper:libs/aar/app-theme-helper-1.3.4.aar \
    material-dialogs-core:libs/aar/material-dialogs-core-0.9.3.0.aar \
    material-dialogs-commons:libs/aar/material-dialogs-commons-0.9.3.0.aar \
    material-cab:libs/aar/material-cab-0.1.12.aar \
    SeekArc:libs/aar/SeekArc-1.2-kmod.aar \
    AndroidSlidingUpPanel:libs/aar/AndroidSlidingUpPanel-3.3.0-kmod3.aar \
    licensesdialog:libs/aar/licensesdialog-1.8.1.aar \
    RecyclerView-FastScroll:libs/aar/RecyclerView-FastScroll-1.9-kmod.aar \
    material-intro:libs/aar/material-intro-1.6.aar \
    android-observablescrollview:libs/android-observablescrollview-1.6.0.jar \
    retrofit:libs/retrofit-2.1.0.jar \
    converter-gson:libs/converter-gson-2.1.0.jar \
    anjlab-library:libs/anjlab-library-2.4.0.jar \
    glide-local:libs/glide-3.7.0.jar \
    okhttp3:libs/okhttp-3.3.0.jar \
    okhttp3-integration:libs/okhttp3-integration-1.4.0.jar \
    okio-sink:libs/okio-1.8.0.jar \
    advrecycler-view:libs/advrecyclerview-0.10.0.jar \
    jaudiotagger:libs/jaudiotagger-android-2.2.3.jar \
    gson:libs/gson-2.7.jar \

include $(BUILD_MULTI_PREBUILT)
