void setup() {
  size(1400, 700, P2D);
  pixelDensity(displayDensity());
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  noLoop();
}

void draw() {
  background(0, 0, 98);
  
  float size = height * 0.8;

  pushMatrix();
  translate(width/2, height/2);
  branch(size);
  popMatrix();
  
  // saveFrame("frames/####.png");
}

void branch(float size) {
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, random(100));
  rect(0, 0, size, size);

  float P = 0.65;
  size *= 0.5;

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