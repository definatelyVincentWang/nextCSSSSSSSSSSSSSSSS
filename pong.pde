class Ball {
  boolean playerOneLoss;
  boolean playerTwoLoss;
  float x,y;
  float velx = 1;
  float vely = 1;
  float size;
  Ball(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    playerOneLoss = false;
    playerTwoLoss = false;
  }
  void display() {
    x += velx;
    y += vely;
    circle(x,y,size * 2);
    if (y - size < 0 || y + size < height) {
      vely = -vely;
    }
    boolean OtherxTrue = p2x > x && p2x < x + w;
    boolean OtheryTrue = p2y > y && p2y < y + h;
    boolean xTrue = p1x > x && p1x < x + w;
    boolean yTrue = p1y > y && p1y < y + h;
    if ((xTrue && yTrue) || (OtherxTrue && OtheryTrue)) {
      velx = -velx;
      vely = -vely;
    }
    
    if (x - size < 0) {
      playerOneLoss = true;
    }
    if (x + size > height) {
      playerTwoLoss = true;
    }
  }
}

float p1x, p1y;
float p2x, p2y;
float w, h;
float changeVel = 20;
Ball b;

void keyPressed() {
  if (key == 'w') {
    p1y -= changeVel;
  }
  if (key == 's') {
    p1y += changeVel;
  }
  if (keyCode == UP) {
    p2y -= changeVel;
  }
  if (keyCode == DOWN) {
    p2y += changeVel;
  }
}

void setup() {
  b = new Ball(width / 2, height / 2, 10);
  size(600,600);
  p1x = 10;
  p2x = width - 10 - w;
  p1y = height / 2 + w;
  p2y = height / 2 + w;
  
  w = 10;
  h = 100;
}

void draw() {
  background(200);
  b.display();
  rect(p1x, p1y, w, h);
  rect(p2x, p2y, w, h);
}
