color bgColor;

void setup() {
  size(1400, 700, P2D);
  pixelDensity(displayDensity());
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  bgColor = color(0, 0, 95);
  noLoop();
}

void draw() {
  background(bgColor);
  
  float size = height * 0.8;

  pushMatrix();
  translate(width/2 - size/2, height/2);
  branch(size);
  popMatrix();

  pushMatrix();
  translate(width/2 + size/2, height/2);
  branch(size);
  popMatrix();
  
  // saveFrame("frames/####.png");
}

void branch(float size) {
  noStroke();
  if (random(1) < 0.8) {
    fill(0, 0, random(10));
  } else {
    fill(bgColor);
  }
  rect(0, 0, size - 1, size - 1);

  float P = map(size, 5, height * 0.8, 0.5, 0.8);
  size *= 0.5;
  size -= 1;

  if (size > 5) {
    if (random(1) < P) {
      pushMatrix();
      translate(-size/2, -size/2);
      branch(size);
      popMatrix();
    }
    if (random(1) < P) {
      pushMatrix();
      translate(size/2, -size/2);
      branch(size);
      popMatrix();
    }
    if (random(1) < P) {
      pushMatrix();
      translate(-size/2, size/2);
      branch(size);
      popMatrix();
    }
    if (random(1) < P) {
      pushMatrix();
      translate(size/2, size/2);
      branch(size);
      popMatrix();
    }
  }
}

void mousePressed() {
  redraw();
}