ArrayList<Particle> particles = new ArrayList<Particle>(); // パーティクルのリスト
int numParticles = 10000; // パーティクルの数
int updateCount;
int mode = 1; // 1 or 2

// パーティクル用変数
float noiseScale;
float angleAmplitude;
float startAngle;
int[] palette = new int[3];

void setup() {
  size(1200, 600, P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  reset();
}

void reset() {
  background(0, 0, 5);
  updateCount = 0;

  // noiseのシード値を変更
  int seed = (int)random(10000);
  noiseSeed(seed);

  noiseScale = 0.01;
  angleAmplitude = random(3, 12);
  startAngle = random(TWO_PI);

  // パレットをランダムに設定
  for (int i = 0; i < palette.length; i++) {
    palette[i] = (int)random(360);
  }
  
  initPoints();
}

void initPoints() {
  particles.clear();
  for (int i = 0; i < numParticles; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  // 全てのパーティクルを点で描画
  strokeWeight(1);
  beginShape(POINTS);
  for (Particle p : particles) {
    p.update();
    p.addVertex();
  }
  endShape();

  updateCount++;
}

void keyPressed() {
  switch(key) {
    case 'r': reset(); break;
    case 's': saveFrame("frames/####.png"); break;
    case '1': mode = 1; reset(); break;
    case '2': mode = 2; reset(); break;
  }
}