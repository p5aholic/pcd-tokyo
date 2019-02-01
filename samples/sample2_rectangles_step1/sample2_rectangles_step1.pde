float minSize, maxSize;

void setup() {
  size(700, 700, P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  noLoop();

  // 正方形の最小サイズと最大サイズを設定
  minSize = 5;
  maxSize = height * 0.8;
}

void draw() {
  background(0, 0, 100);

  // 分岐開始
  branch(width/2, height/2, maxSize);

  // saveFrame("frames/####.png");
}

void branch(float cx, float cy, float size) {
  // 現在の座標に正方形を描く
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, random(100));
  rect(cx, cy, size, size);

  size *= 0.5;

  // 最小サイズ未満なら分岐を終了
  if (size < minSize) return;

  // 1分岐ごとに65%の確率で4分岐する
  float P = 0.65;

  if (random(1) < P) {
    branch(cx-size/2, cy-size/2, size); // 左上
  }
  if (random(1) < P) {
    branch(cx+size/2, cy-size/2, size); // 右上
  }
  if (random(1) < P) {
    branch(cx+size/2, cy+size/2, size); // 右下
  }
  if (random(1) < P) {
    branch(cx-size/2, cy+size/2, size); // 左下
  }
}

void mousePressed() {
  redraw();
}
