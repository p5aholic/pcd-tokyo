float noiseAmplitude;
float noiseScale;

void setup() {
  size(1200, 400, P2D);
  pixelDensity(displayDensity());

  noiseAmplitude = height;
  noiseScale = 0.01;
}

void draw() {
  background(255);

  // ｘ座標からノイズ値を作りy方向の波で表す
  stroke(30);
  strokeWeight(2);
  for (int x = 0; x < width; x++) {
    float n = noise(x * noiseScale + frameCount * 0.02);
    float noiseY = noiseAmplitude * n;
    point(x, height - noiseY);
  }
}
