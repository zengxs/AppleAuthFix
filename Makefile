TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = Asspp
FINALPACKAGE = 1
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppleAuthFix
${TWEAK_NAME}_FILES = main.x
${TWEAK_NAME}_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
