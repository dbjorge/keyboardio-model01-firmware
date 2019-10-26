# This is a stub makefile; all actual build logic comes from kaleidoscope-builder

LIB_PATH ?= ./lib
BOARD_HARDWARE_PATH ?= $(LIB_PATH)/hardware
KALEIDOSCOPE_BUILDER_DIR ?= $(BOARD_HARDWARE_PATH)/keyboardio/avr/libraries/Kaleidoscope/bin

ARDUINO_DIRNAME = arduino-1.8.10
ARDUINO_FILENAME = $(ARDUINO_DIRNAME)-windows.zip
ARDUINO_FILEPATH = $(LIB_PATH)/$(ARDUINO_FILENAME)
ARDUINO_PATH ?= $(LIB_PATH)/$(ARDUINO_DIRNAME)
ARDUINO_DOWNLOAD_URL = http://downloads.arduino.cc/$(ARDUINO_FILENAME)

ifeq ("$(wildcard $(BOARD_HARDWARE_PATH)/keyboardio/build-tools/makefiles/rules.mk)","")
$(info ***************************************************************************)
$(info Unable to autodetect a proper BOARD_HARDWARE_PATH. Did you clone with --recursive?
$(info ***************************************************************************)
$(info )
endif

.PHONY: clean setup

clean:
	rm -rf out tmp

setup:
	@if [ ! -d "$(ARDUINO_PATH)" ]; then \
		echo "Downloading Arduino..."; \
		wget -O "$(ARDUINO_FILEPATH)" -c $(ARDUINO_DOWNLOAD_URL); \
		wget -O "$(ARDUINO_FILEPATH)" -c $(ARDUINO_DOWNLOAD_URL); \
		echo "Extracting to \"$(ARDUINO_PATH)\"..."; \
		unzip $(ARDUINO_FILEPATH) -d $(LIB_PATH); \
		chmod -R 0755 $(ARDUINO_PATH) \
	fi

%:
	BOARD_HARDWARE_PATH="$(BOARD_HARDWARE_PATH)" ARDUINO_PATH="$(ARDUINO_PATH)" $(KALEIDOSCOPE_BUILDER_DIR)/kaleidoscope-builder $@