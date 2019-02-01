void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  // ノイズ調整用
  float noiseScaleX = map(mouseX, 0, width, 0, 0.05);
  float noiseScaleY = map(mouseY, 0, height, 0, 0.05);
  
  // 全てのピクセルに対して座標からノイズ値を作り、色で表す
  int pi = 0;
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float n = noise(x * noiseScaleX, y * noiseScaleY);
      pixels[pi] = color(0, 0, 100 * n);
      pi++;
    }
  }
  updatePixels();
}
