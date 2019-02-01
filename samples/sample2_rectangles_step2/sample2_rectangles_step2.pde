color bgColor;

void setup() {
  size(1400, 700, P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  noLoop();

  bgColor = color(0, 0, 95);
}

void draw() {
  background(bgColor);

  float size = height * 0.8;

  branch(width/2 - size/2, height/2, size);
  branch(width/2 + size/2, height/2, size);

  // saveFrame("frames/####.png");
}

void branch(float cx, float cy, float size) {
  noStroke();
  if (random(1) < 0.5) {
    fill(0, 0, 0, 80);
  } else {
    fill(bgColor, 20);
  }

  float margin = 1.0;
  rect(cx, cy, size - margin, size - margin);

  float P = map(size, 5, height * 0.8, 0.5, 0.8);
  size *= 0.5;
  size -= margin;

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
