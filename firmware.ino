// -*- mode: c++ -*-

#include <Kaleidoscope.h>
#include <Kaleidoscope-LEDControl.h>
#include <Kaleidoscope-LED-ActiveLayerColor.h>

#include "keymap.h"

KALEIDOSCOPE_INIT_PLUGINS(LEDControl, LEDActiveLayerColorEffect);

void setup() {
  static const cRGB layerColormap[] PROGMEM = {
    CRGB(30, 30, 30),
    CRGB(160, 90, 26),
    CRGB(60, 60, 60),
  };
  Kaleidoscope.setup();
  LEDActiveLayerColorEffect.setColormap(layerColormap);
}

void loop() {
  Kaleidoscope.loop();
}
