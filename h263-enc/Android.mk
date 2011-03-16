ifeq ($(strip $(BOARD_USES_WRS_OMXIL_CORE)),true)
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	psb.cpp \
	h263.cpp

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libwrs_omxil_intel_mrst_psb_h263_enc

LOCAL_CPPFLAGS := -DMIXVIDEO_ENCODE_ENABLE=0

LOCAL_LDFLAGS :=

LOCAL_STATIC_LIBRARIES := \

LOCAL_SHARED_LIBRARIES := \
	libwrs_omxil_common \
	liblog \
	libmixcommon \
	libmixvideo \
	libmixvbp \
	libva \
	libva-android \
	libva-tpi


VENDORS_INTEL_MRST_MIXVBP_ROOT := $(VENDORS_INTEL_MRST_LIBMIX_ROOT)/mix_vbp

LOCAL_C_INCLUDES := \
	$(WRS_OMXIL_CORE_ROOT)/utils/inc \
	$(WRS_OMXIL_CORE_ROOT)/base/inc \
	$(WRS_OMXIL_CORE_ROOT)/core/inc/khronos/openmax/include \
	$(PV_INCLUDES) \
	$(TARGET_OUT_HEADERS)/libmixcommon \
	$(TARGET_OUT_HEADERS)/libmixvideo \
	$(TARGET_OUT_HEADERS)/libva \
	$(TARGET_OUT_HEADERS)/libdrm \
	$(TARGET_OUT_HEADERS)/libmixvbp \
	$(TARGET_OUT_HEADERS)/libpsb_drm \
	$(LIBINFODUMP_TOP)

ifeq ($(strip $(COMPONENT_SUPPORT_OPENCORE)),true)
LOCAL_CFLAGS += -DCOMPONENT_SUPPORT_OPENCORE
endif
ifeq ($(strip $(COMPONENT_SUPPORT_BUFFER_SHARING)), true)
LOCAL_CFLAGS += -DCOMPONENT_SUPPORT_BUFFER_SHARING
endif
ifeq ($(strip $(COMPONENT_SUPPORT_USRPTR_SHARING)), true)
LOCAL_CFLAGS += -DCOMPONENT_SUPPORT_USRPTR_SHARING
endif
ifeq ($(strip $(FAKE_USRPTR_SHARING)), true)
LOCAL_CFLAGS += -DFAKE_USRPTR_SHARING
endif

LOCAL_COPY_HEADERS_TO := libwrs_omxil_intel_mrst_psb_h263_enc
LOCAL_COPY_HEADERS := vabuffer.h 

include $(BUILD_SHARED_LIBRARY)
endif