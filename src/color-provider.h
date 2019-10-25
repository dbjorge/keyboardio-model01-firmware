#pragma once

#include <Kaleidoscope.h>
#include <Kaleidoscope-LEDControl.h>

class ColorProvider : public kaleidoscope::plugin::LEDMode {
 public:
  ColorProvider(const cRGB* layer_colors, size_t num_layers) :
    layer_colors(layer_colors),
    num_layers(num_layers)
  { }

 protected:
  virtual void update(void) final {
    for (uint8_t r = 0; r < ROWS; r++) {
      for (uint8_t c = 0; c < COLS; c++) {
        Key k = Layer.lookup(r, c);
        cRGB color = layer_colors[k.keyCode % num_layers];
        ::LEDControl.setCrgbAt(r, c, color);
      }
    }
  };

 private:
  const cRGB* layer_colors;
  size_t num_layers;
};