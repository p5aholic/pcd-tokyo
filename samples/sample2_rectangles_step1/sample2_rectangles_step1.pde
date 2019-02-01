void setup() {
  size(700, 700, P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  noLoop();
}

void draw() {
  background(0, 0, 100);

  float size = height * 0.8;
  branch(width/2, height/2, size);

  // saveFrame("frames/####.png");
}

void branch(float cx, float cy, float size) {
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, random(100));
  rect(cx, cy, size, size);

  float P = 0.65;
  size *= 0.5;

  if (size > 5) {
    if (random(1) < P) {
      branch(cx-size/2, cy-size/2, size);
    }
    if (random(1) < P) {
      branch(cx+size/2, cy-size/2, size);
    }
    if (random(1) < P) {
      branch(cx+size/2, cy+size/2, size);
    }
    if (random(1) < P) {
      branch(cx-size/2, cy+size/2, size);
    }
  }
}

void mousePressed() {
  redraw();
}
