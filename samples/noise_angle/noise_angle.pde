float x, y;
float speed;
float noiseScale;
float angleAmplitude;
float startAngle;

int mode = 1; // 1 or 2

void setup() {
  size(600, 600, P2D);
  pixelDensity(displayDensity());

  x = random(width);
  y = random(height);
  speed = 1.0;
  noiseScale = 0.01;
  // angleAmplitude = random(3, 12);
  // startAngle = random(TWO_PI);
  angleAmplitude = PI;
  startAngle = 0;
}

void draw() {
  background(255);
  translate(width/2, height/2);

  stroke(30);
  strokeWeight(5);
  beginShape(POINTS);
  for (int i = 0; i < 36; i++) {
    float angle = i * (TWO_PI / 36);
    float px = width * 0.4 * cos(angle);
    float py = width * 0.4 * sin(angle);
    vertex(px, py);
  }
  endShape();

  // 現在の座標からノイズ値を得る
  float n = noise(x * noiseScale, y * noiseScale);
  // ノイズ値を元に角度を計算
  float angle = startAngle + angleAmplitude * n;
  // 角度から速度を計算
  float vx = speed * cos(angle);
  float vy = speed * sin(angle);
  // 次の座標 = 現在の座標 + 速度
  x += vx;
  y += vy;

  pushMatrix();
  rotate(angle);
  line(0, 0, width * 0.4, 0);
  line(width * 0.4, 0, width * 0.4 - 25, -25);
  line(width * 0.4, 0, width * 0.4 - 25, +25);
  popMatrix();
}