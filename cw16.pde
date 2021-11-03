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
    boolean xTrue = b.x - b.radius <= x + w && b.x + b.radius >= x;
    boolean yTrue = b.y - b.radius <= y + h && b.y + b.radius >= y;
    return xTrue && yTrue;
  }
}

Box box;
Ball ball;

void setup() {
  size(400,400);
  box = new Box(200,200,50,50);
  ball = new Ball(200,200,50);
  box.draw();
  ball.draw();
  ball.draw(200,100);
  println(box.intersects(ball));
}


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
