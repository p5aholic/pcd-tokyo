class Particle {
  PVector p;
  PVector prevP;
  float noiseDetail;
  float speed;
  color strokeColor;

  Particle() {
    p = new PVector(random(width), random(height));
    prevP = new PVector(p.x, p.y);

    noiseDetail = 0.01;
    speed = 1.0;
    strokeColor = color(0, 0, random(50, 100), 8);
  }

  void update() {
    float n = noise(p.x * noiseDetail, p.y * noiseDetail);
    float angle = TWO_PI * n;
    float vx = speed * cos(angle);
    float vy = speed * sin(angle);
    p.x += vx;
    p.y += vy;
  }

  void addVertex() {
    stroke(strokeColor);
    vertex(prevP.x, prevP.y);
    vertex(p.x, p.y);
    
    prevP.set(p);
  }
}