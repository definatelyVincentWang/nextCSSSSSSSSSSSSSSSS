// WallBounce with gravity

/** 95% of the time, in this code, we'll be working inside World Coordinates
For this problem, World Coordinates are a normal, mathematical world with
(-100 <= x <= 100) and (-100 <= y <= 100) and the origin at the 
center of the screen.  Most of the time, until the very end, we don't
care about the peculiarities of Processing's coordinates.

Then, at the end, we'll just use the map() function to convert from our
world coords to Processing coords to place and size our bouncing circle.
*/ 

float x, y; // center of circle
float radius;  // in world coords, etc.
float vel;  // how far the circle moves (initially) from frame to frame
float xvel, yvel;  // the x and y components of vel
float angle; // initial angle 
float g;  // gravity: how much to subtract from yvel every frame
float friction; // a number less than one (like 0.9) to diminish the
                // yvel after each  bounce on the floor: 
                // yvel = friction * yvel after a bounce

void setup() {
  background(0);
  // start near the left edge high up
  x = -80;
  y = 70;
  angle = random(PI/2);  // pointed up and to the right
  radius = 5;
  vel = 1.5;
  xvel = vel * cos(angle);
  yvel = vel * sin(angle);
  friction = 0.9;
  g = 0.1;
  size(400,400);
}

void draw() {
  background(0);
  x += xvel;  // move it
  y += yvel;
  circle(map(x, -100, 100, 0, 400),map(y, -100, 100, 0, 400),radius);
  // decrease velocity every time
  yvel -= g;
  // if hits ground
  if (y - radius <= -100) {
    yvel = - (yvel * friction);
  }
  // if hits wall
  if (x + radius >= 100 || x - radius <= -100) {
    xvel = -xvel;
  }
  // Now worry about walls, and gravity and floor bounces...
}
