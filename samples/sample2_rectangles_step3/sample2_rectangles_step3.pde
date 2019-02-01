float minSize, maxSize;

int numPalette = 2;
int[] palette = new int[numPalette];

void setup() {
  size(1400, 700, P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  noLoop();

  // 正方形の最小サイズと最大サイズを設定
  minSize = 5;
  maxSize = height * 0.8;
}

void draw() {
  changeColor();
  background(getRandomPalette(), 5, 90);

  // 右と左で2つ正方形分割をする
  branch(width/2 - maxSize/2, height/2, maxSize);
  branch(width/2 + maxSize/2, height/2, maxSize);

  // saveFrame("frames/####.png");
}

// パレットの色をランダムに変更
void changeColor() {
  for (int i = 0; i < numPalette; i++) {
    palette[i] = (int)random(360);
  }
}

// パレットからランダムに1色選ぶ
int getRandomPalette() {
  return palette[(int)random(numPalette)];
}

void branch(float cx, float cy, float size) {
  strokeWeight(1);
  stroke(0, 0, 0, 5);
  if (random(1) < 0.9) {
    drawGradationRect(cx, cy, size);
  } else {
    drawRect(cx, cy, size);
  }

  size *= 0.5;

  // 最小サイズ未満なら分岐を終了
  if (size < minSize) return;

  // サイズが小さいほど分岐確率を下げる
  float P = map(size, minSize, maxSize, 0.4, 1);

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

// ビビッドな色の正方形
void drawRect(float cx, float cy, float size) {
  fill(getRandomPalette(), 100, 100);
  rect(cx, cy, size, size);
}

// 薄いグラデーションの長方形
void drawGradationRect(float cx, float cy, float size) {
  // 90度、180度、270度のどれかで回転する
  pushMatrix();
  translate(cx, cy);
  int r = (int)random(4);
  rotate(r * HALF_PI);

  // グラデーションする長方形を描く
  beginShape();
  strokeWeight(1);
  stroke(0, 0, 0, 5);
  fill(palette[0], 100, 100, 10);
  vertex(-size/2, -size/2);
  vertex(+size/2, -size/2);

  fill(palette[1], 100, 100, 10);
  vertex(+size/2, +size/2);
  vertex(-size/2, +size/2);
  endShape(CLOSE);

  popMatrix();
}

void mousePressed() {
  redraw();
}
