class Particle {
  float x, y;        // 座標
  float speed;       // 速さ
  color strokeColor; // 線の色
  int hue;           // 色調

  Particle() {
    // 初期値の設定
    x = random(width);
    y = random(height);
    speed = 1.0;
    hue = palette[(int)random(palette.length)];
  }

  // 座標更新
  void update() {
    // 現在の座標からノイズ値を得る
    float n = noise(x * noiseScale, y * noiseScale);
    // ノイズ値を元に角度を計算
    float angle = angleAmplitude * n;
    // 角度から速度を計算
    float vx = speed * cos(angle);
    float vy = speed * sin(angle);
    // 次の座標 = 現在の座標 + 速度
    x += vx;
    y += vy;

    float sat = 100 - updateCount * 0.4; // 彩度を徐々に100から0に
    strokeColor = color(hue, sat, 100, 8);
  }

  // 頂点の追加
  void addVertex() {
    stroke(strokeColor);
    vertex(x, y);
  }
}
