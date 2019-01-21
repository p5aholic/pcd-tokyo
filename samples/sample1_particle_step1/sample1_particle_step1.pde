ArrayList<Particle> particles = new ArrayList<Particle>();
int numParticles = 1000;
color bgColor;

void setup () {
  size(1600, 800, P2D);
  smooth(8);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  bgColor = color(0, 0, 5);
  reset();
}

void reset() {
  background(bgColor);
  noiseDetail(8, 0.5);
  noiseSeed(millis());
  initPoints();
}

void initPoints() {
  particles.clear();
  for (int i = 0; i < numParticles; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  for (int i = 0; i < 10; i++) {
   
  strokeWeight(2);
  beginShape(POINTS);
  for (Particle p : particles) {
    p.update();
    p.addVertex();
  }
  endShape();

  }
}

void keyPressed() {
  switch (key) {
    case 'r': reset(); break;
    case 's': saveFrame("frames/####.png"); break;
  }
}