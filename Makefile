# This is a stub makefile; all actual build logic comes from kaleidoscope-builder

THIS_MAKEFILE_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BOARD_HARDWARE_PATH ?= $(THIS_MAKEFILE_DIR)/lib/hardware
KALEIDOSCOPE_BUILDER_DIR ?= $(BOARD_HARDWARE_PATH)/keyboardio/avr/libraries/Kaleidoscope/bin/
SKETCH = firmware

ifeq ("$(wildcard $(BOARD_HARDWARE_PATH)/keyboardio/build-tools/makefiles/rules.mk)","")
$(info ***************************************************************************)
$(info Unable to autodetect a proper BOARD_HARDWARE_PATH. Did you clone with --recursive?
$(info ***************************************************************************)
$(info )
endif

%:
	BOARD_HARDWARE_PATH="$(BOARD_HARDWARE_PATH)" SKETCH="$(SKETCH)" $(KALEIDOSCOPE_BUILDER_DIR)/kaleidoscope-builder $@