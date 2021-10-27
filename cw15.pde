// State variables...

Ball[] balls = new Ball[3];

color CHEESE = color(231,235,28);
color EARWAX = color(26,117,32);
color BURP = color(11,163,156);

// states....
int RESTING = 0;
int RISING = 1;
int FALLING = 2;

float speed = 2;
float theta = 0;
float theta_speed = 0.03;

void setup () {
  size(600,600);
  balls[0] = new Ball(width/4,CHEESE);
  balls[1] = new Ball(width/2,EARWAX);
  balls[2] = new Ball(3*width/4,BURP);
  background(200);

}

void draw() {
  float xr,yr;
  
  background(200);
  for (int i  = 0; i < 3; ++i) {
    balls[i].move();
    balls[i].display();
  }
  
  // rotating squares
  xr = width/2 + (width/5)*cos(theta);
  yr = height/4 + (height/6)*sin(theta);
  rect(xr,yr,10,10);
  theta += theta_speed;
}

void mousePressed() {
  // send the click signal to each of the balls, and let them take care of it..
  for (int i = 0; i < 3; ++i)
    balls[i].IfClicked(mouseX, mouseY);
}

// ========================== Ball class ======================
class Ball {
  float x, y, radius;
  color c;
  int state;
  boolean stopped;
  
  Ball(float x_pos, color c_in) {
    x = x_pos;
    radius = 50;
    c = c_in;
    y = height - radius;
    state = RESTING;
    stopped = false;
  }
  
  void move() {
    if (stopped || state == RESTING) return;
    if (state == RISING) {
      y -= speed;
      if (y < height - 5*radius) 
        state = FALLING;
    } else if (state == FALLING) {
      y += speed;
      if (y > height - radius)
        state = RESTING;
    }
  }
  
  void display() {
    if (stopped)
      fill(0);
    else
      fill(c);
    circle(x,y,2*radius);
  } 

  void IfClicked(float mx, float my) {
    // was I clicked on?
    if (dist(x,y,mx,my) > radius)
      // nope, do nothing
      return;
      
    // yes, it was me...
    if (state == RISING || state == FALLING)
      stopped = !stopped;
    else
      state = RISING;
  }
}


