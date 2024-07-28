# include $(call all-subdir-makefiles)
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := preinstall_app.sh
LOCAL_SRC_FILES := preinstall_app.sh
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT) 