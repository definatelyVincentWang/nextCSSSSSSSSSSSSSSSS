// Multiple bouncing balls in object form 

Ball[] balls = new Ball[10];   // array of 10 ball variables
float max_vel = 3.5;

void setup() {
  size(600,400);
  // create 10 random balls of increasing size
  for (int i = 0; i < 10; ++i) {
    color c = color(random(255), random(255), random(255));
    balls[i] = new Ball(10+2*i, c);
  }
}

void draw() {
  background(200);
  for (int i = 0; i < 10; ++i) {
    balls[i].move();
    balls[i].display();
  }
}

// ========================== the Ball class ============================
class Ball {
  float x,y,xvel,yvel,radius;
  color c;
  
  // The main constructor
  Ball(float x_in, float y_in, float xvel_in, float yvel_in,float radius_in, color c_in) {
    x = x_in;
    y = y_in;
    xvel = xvel_in;
    yvel = yvel_in;
    radius = radius_in;
    c = c_in;
  }
  
  // the constructor for the lazy user who only specifies the radius
  Ball(float radius_in, color c) {
    // let's just call the previous constructor with appropriate random values
    // for the position and velocity.
    
    // the keyword "this" is used to call the previous constructor (above)
    //  we also make sure that the circle doesn't intersect any wall
    this( random(radius_in,width-radius_in), // the random x value
    random(radius_in,height-radius_in),      // the random y value
    random(-max_vel,max_vel),                // the random xvel
    random(-max_vel,max_vel),                // the random yvel
    radius_in,
    c
    );
  }
  
  void move() {
   // fill in this movement code, and make sure that the ball bounces off the walls
   x += xvel;
   y += yvel;
   
   if ((x + radius > 400) || (x - radius < 0)) {
     xvel = -xvel;
   }
   if ((y + radius > 400) || (y - radius < 0)) {
     yvel = -yvel;
   }
  }
  
  void display() {
    // your display code here.
    fill(c);
    circle(x,y,radius * 2);
  }
}
