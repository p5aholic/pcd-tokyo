ArrayList<Particle> particles = new ArrayList<Particle>(); // パーティクルのリスト
int numParticles = 10000; // パーティクルの数

// パーティクル用変数
float noiseScale;
float angleAmplitude;

void setup() {
  size(1200, 600, P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  reset();
}

void reset() {
  background(0, 0, 5);

  // noiseのシード値を変更
  int seed = (int)random(10000);
  noiseSeed(seed);

  noiseScale = 0.01;
  angleAmplitude = 8;
  
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
}

void keyPressed() {
  switch (key) {
    case 'r': reset(); break;
    case 's': saveFrame("frames/####.png"); break;
  }
}