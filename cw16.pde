// Create a Ball class
class Ball {
  // Ball's parameters:
  float x, y, radius;

  // Ball's consructor:
  public Ball(float cx, float cy, float rad) { // 
    x = cx;
    y = cy;
    radius = rad;
  }

  // two draw() methods:
  void draw(){ 
    //your code to draw the circle
    circle(x,y,radius * 2);
  }
  void draw(float new_x, float new_y) {
    // your code updates the parameters, then:
    x = new_x;
    y = new_y;
    this.draw();
  }
}

// create a Box class:
class Box {
  // Box's parameters:
  float x,y,w,h;  // upper-left x and y, width and height;

  // constructor:
  Box(float rx, float ry, float rw, float rh) {
    // your code
    x = rx;
    y = ry;
    w = rw;
    h = rh;
  }

  // create a draw method.
  void draw() {
    rect(x,y,w,h);
  }
  // the intersects method takes a Ball argument and returns a boolean: true if this Box intersects the given Ball, else false
  boolean intersects(Ball b) {
    float centerX = x + w / 2;
    float centerY = y + h / 2;
    float halfDiagonal = dist(x,y, centerX, centerY);
    boolean specialCase = dist(centerX, centerY, b.x,b.y) < b.radius + halfDiagonal;
    boolean xTrue = b.x - b.radius <= x + w && b.x + b.radius >= x;
    boolean yTrue = b.y - b.radius <= y + h && b.y + b.radius >= y;
    return specialCase && xTrue && yTrue;
  }
}

Box box;
Ball ball;

void setup() {
  size(400,400);
  box = new Box(100,100,200,100);
  //ball = new Ball(350,150,12.5); // -> returns false
  //ball = new Ball(320, 150, 32.5); // -> returns true
  //ball = new Ball(265, 125, 25); // -> returns true
  //ball = new Ball(90, 90, 25); // -> returns true
  ball = new Ball(80, 80, 25); // -> returns false
  box.draw();
  ball.draw();
  //ball.draw(200,100);
  println(box.intersects(ball));
}

/*
void draw() {
  background(0);
  box.draw();
  ball.draw();
  println(box.intersects(ball));
}

void keyPressed() {
  if (key == 'w') {
    ball.y -= 10;
  }
  if (key == 's') {
    ball.y += 10;
  }
  if (key == 'a') {
    ball.x -= 10;
  }
  if (key == 'd') {
    ball.x += 10;
  }
}
*/
