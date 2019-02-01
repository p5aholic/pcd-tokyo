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
  background(getRandomPalette(), 5, 95);

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
    fill(getRandomPalette(), 100, 100, 10);
  } else {
    fill(getRandomPalette(), 100, 100);
  }
  rect(cx, cy, size, size);

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

void mousePressed() {
  redraw();
}
