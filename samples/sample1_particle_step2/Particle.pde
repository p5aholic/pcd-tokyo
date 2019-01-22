class Particle {
  PVector p;
  float noiseScale;
  float speed;
  color strokeColor;

  Particle() {
    p = new PVector(random(width), random(height));

    noiseScale = 0.01;
    speed = 1.0;
    strokeColor = color(0, 0, random(50, 100), 8);
  }

  void update() {
    float n = noise(p.x * noiseScale, p.y * noiseScale);
    float angle = TWO_PI * n;
    float vx = speed * cos(angle);
    float vy = speed * sin(angle);
    p.x += vx;
    p.y += vy;
  }

  void addVertex() {
    stroke(strokeColor);
    vertex(p.x, p.y);
  }
}