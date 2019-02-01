void setup() {
  // 頂点に色を指定する方法でのグラデーションはOpenGLを使用するのでP2Dを指定しておく
  size(600, 600, P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  noLoop();
}

void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  
  float size = width * 0.8;
  
  // 上から下へのグラデーション
  beginShape();
  fill(random(360), 100, 100);
  vertex(-size/2, -size/2);
  vertex(+size/2, -size/2);

  fill(random(360), 100, 100);
  vertex(+size/2, +size/2);
  vertex(-size/2, +size/2);
  endShape(CLOSE);
}

void mousePressed() {
  redraw();
}
