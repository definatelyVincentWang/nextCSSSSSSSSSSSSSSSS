/* ===================
  This Ball class starts with what we have developed
  in class. You must add some constructors & other methods.
 =================== */
class Ball {
  int cx;
  int cy;
  int xVel;
  int yVel;
  int radius;
  color c;

  Ball() {
    c = color(int(random(255)), int(random(255)), int(random(255)));
    radius = int(random(10, 26));
    cx = int(random(radius, width-radius));
    cy = int(random(radius, height-radius));
    xVel= int(random(-5, 5));
    if (xVel == 0) { 
      xVel = 5;
    }
    yVel = int(random(-5, 5));
    if (yVel == 0) { 
      yVel = 5;
    }
  } //constructor

  Ball(color f) {
    this(
      (int)random(width), (int)random(height), 0, 0, (int)random(10,25),f
    );
  }


/* ===================
  This constructor takes 3 parameters to set 
  the x and y speeds and color. All the 
  other values should be set randomly.
 =================== */
  Ball(int xv, int yv, color f) {
    this(
      0,0,xv,yv,(int)random(10,25),f
    );
  }

/* ===================
  This constructor takes a parameter for each
  instance variable.
 =================== */
  Ball(int x, int y, int xv, int yv, int r, color f) {
    xVel = xv;
    yVel = yv;
    c = f;  
    cx = x;
    cy = y;
    radius = r;
  }

  void display() {
    fill(c);
    circle(this.cx, this.cy, this.radius*2);
  }


  void move() {
    if (cx <= radius || cx >= (width-radius)) {
      xVel *= -1;
    }
    if ( cy <= radius ||
      cy >= (height-radius)) {
      yVel *= -1;
    }
    cx+= xVel;
    cy+= yVel;
  }
  
/* ===================
  Changes the position for the calling Ball.
  The new position shoudl eb randomly assigned, but the 
  entire ball should always be visible.
 =================== */
  void teleport() {
    cx = (int)random(width/2);
    cy = (int)random(height/2);
  }

/* ===================
  Returns
    true: if the calling Ball is "touching" the paramter ball at all. (done)
    false: in any other case. (done)
    
    There is a built in processing function: dist(x0, y0, x1, y1).
    It returns the distance between (x0, y0) and (x1, y1) as a float.
    It will be helpful here.
 =================== */
  boolean detect(Ball other) {
    if (dist(cx,cy,other.cx,other.cy) < radius + other.radius) {
      return true;
    }
    return false;
  }
  
}
