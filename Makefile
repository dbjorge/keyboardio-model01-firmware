# This is a stub makefile; all actual build logic comes from kaleidoscope-builder

THIS_MAKEFILE_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
LIB_PATH ?= $(THIS_MAKEFILE_DIR)/lib
BOARD_HARDWARE_PATH ?= $(LIB_PATH)/hardware
KALEIDOSCOPE_BUILDER_DIR ?= $(BOARD_HARDWARE_PATH)/keyboardio/avr/libraries/Kaleidoscope/bin
SKETCH = firmware

ARDUINO_DIRNAME = arduino-1.8.8
ARDUINO_FILENAME = $(ARDUINO_DIRNAME)-linux64.tar.xz
ARDUINO_FILEPATH = $(LIB_PATH)/$(ARDUINO_FILENAME)
ARDUINO_PATH ?= $(LIB_PATH)/$(ARDUINO_DIRNAME)
ARDUINO_DOWNLOAD_URL = http://downloads.arduino.cc/$(ARDUINO_FILENAME)

ifeq ("$(wildcard $(BOARD_HARDWARE_PATH)/keyboardio/build-tools/makefiles/rules.mk)","")
$(info ***************************************************************************)
$(info Unable to autodetect a proper BOARD_HARDWARE_PATH. Did you clone with --recursive?
$(info ***************************************************************************)
$(info )
endif

.PHONY: setup

setup:
	@if [ ! -d "$(ARDUINO_PATH)" ]; then \
		echo "Downloading Arduino..."; \
		wget -O "$(ARDUINO_FILEPATH)" -c $(ARDUINO_DOWNLOAD_URL); \
		wget -O "$(ARDUINO_FILEPATH)" -c $(ARDUINO_DOWNLOAD_URL); \
		echo "Extracting to \"$(ARDUINO_PATH)\"..."; \
		tar xf $(ARDUINO_FILEPATH) -C $(LIB_PATH); \
	fi

%:
	BOARD_HARDWARE_PATH="$(BOARD_HARDWARE_PATH)" ARDUINO_PATH="$(ARDUINO_PATH)" $(KALEIDOSCOPE_BUILDER_DIR)/kaleidoscope-builder $@