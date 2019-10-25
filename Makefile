# This stub makefile for a Kaleidoscope plugin pulls in 
# all targets from the Kaleidoscope-Plugin library

THIS_MAKEFILE_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BOARD_HARDWARE_PATH = $(THIS_MAKEFILE_DIR)/lib/hardware

ifeq ("$(wildcard $(BOARD_HARDWARE_PATH)/keyboardio/build-tools/makefiles/rules.mk)","")
$(info ***************************************************************************)
$(info Unable to autodetect a proper BOARD_HARDWARE_PATH. Did you clone with --recursive?
$(info ***************************************************************************)
$(info )
endif

include $(BOARD_HARDWARE_PATH)/keyboardio/build-tools/makefiles/rules.mk
