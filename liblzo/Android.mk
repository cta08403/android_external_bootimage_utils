



LOCAL_PATH:= $(call my-dir)

ifeq ($(HOST_OS),windows)
	# Fixup windows global LD_FLAGS incase we are using mingw6
	HOST_GLOBAL_LDFLAGS := -Wl,--enable-stdcall-fixup
endif


common_SRC_FILES:=  \
	src/lzo_crc.c \
	src/lzo_init.c \
	src/lzo_ptr.c \
	src/lzo_str.c \
	src/lzo_util.c \
	src/lzo1.c \
	src/lzo1_99.c \
	src/lzo1a.c \
	src/lzo1a_99.c \
	src/lzo1b_1.c \
	src/lzo1b_2.c \
	src/lzo1b_3.c \
	src/lzo1b_4.c \
	src/lzo1b_5.c \
	src/lzo1b_6.c \
	src/lzo1b_7.c \
	src/lzo1b_8.c \
	src/lzo1b_9.c \
	src/lzo1b_99.c \
	src/lzo1b_9x.c \
	src/lzo1b_cc.c \
	src/lzo1b_d1.c \
	src/lzo1b_d2.c \
	src/lzo1b_rr.c \
	src/lzo1b_xx.c \
	src/lzo1c_1.c \
	src/lzo1c_2.c \
	src/lzo1c_3.c \
	src/lzo1c_4.c \
	src/lzo1c_5.c \
	src/lzo1c_6.c \
	src/lzo1c_7.c \
	src/lzo1c_8.c \
	src/lzo1c_9.c \
	src/lzo1c_99.c \
	src/lzo1c_9x.c \
	src/lzo1c_cc.c \
	src/lzo1c_d1.c \
	src/lzo1c_d2.c \
	src/lzo1c_rr.c \
	src/lzo1c_xx.c \
	src/lzo1f_1.c \
	src/lzo1f_9x.c \
	src/lzo1f_d1.c \
	src/lzo1f_d2.c \
	src/lzo1x_1.c \
	src/lzo1x_9x.c \
	src/lzo1x_d1.c \
	src/lzo1x_d2.c \
	src/lzo1x_d3.c \
	src/lzo1x_o.c \
	src/lzo1x_1k.c \
	src/lzo1x_1l.c \
	src/lzo1x_1o.c \
	src/lzo1y_1.c \
	src/lzo1y_9x.c \
	src/lzo1y_d1.c \
	src/lzo1y_d2.c \
	src/lzo1y_d3.c \
	src/lzo1y_o.c \
	src/lzo1z_9x.c \
	src/lzo1z_d1.c \
	src/lzo1z_d2.c \
	src/lzo1z_d3.c \
	src/lzo2a_9x.c \
	src/lzo2a_d1.c \
	src/lzo2a_d2.c


common_C_INCLUDES += $(LOCAL_PATH)/include


# Cyanogenmod already builds liblzo static from the external/lzo directory
# so we only need to build a target one if we are using a different source
# tree like the AOSP for example. 
ifeq ($(CM_VERSION),)


# static library
# =====================================================

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(common_SRC_FILES)
LOCAL_C_INCLUDES:= $(common_C_INCLUDES)
LOCAL_MODULE := liblzo-static
LOCAL_PRELINK_MODULE:= false
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)






# dynamic library
# =====================================================

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(common_SRC_FILES)
LOCAL_C_INCLUDES:= $(common_C_INCLUDES)
LOCAL_MODULE := liblzo
LOCAL_PRELINK_MODULE:= false
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

endif


#
# We alway need to build for the host 
#

# static library for the host
# =====================================================

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(common_SRC_FILES)
LOCAL_C_INCLUDES:= $(common_C_INCLUDES)
LOCAL_MODULE := liblzo-static
LOCAL_PRELINK_MODULE:= false
LOCAL_MODULE_TAGS := optional
include $(BUILD_HOST_STATIC_LIBRARY)

# dynamic library for the host
# =====================================================

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(common_SRC_FILES)
LOCAL_C_INCLUDES:= $(common_C_INCLUDES)
LOCAL_MODULE := liblzo
LOCAL_PRELINK_MODULE:= false
LOCAL_MODULE_TAGS := optional
include $(BUILD_HOST_SHARED_LIBRARY)

