int x,y;

int maxX,maxY;
int diameter;
int radius;

int dir;
int incr;

void setup() {
  size(600,400);
  maxX = 600;
  maxY = 400;
  
  background(0,0,255);
  fill(365,0,0);
  noStroke();
  
  diameter = 50;
  radius = diameter/2;
  
  x = radius;
  y = radius;
  
  dir = 0;
  
  incr = 5;
}

void draw() {
  background(0,0,255);
  if (dir == 0) {
    x += incr;
    if (x + radius >= maxX)
      dir = (dir + 1) % 4;
  } else if (dir == 1) {
    y += incr;
    if (y + radius >= maxY)
      dir = (dir + 1) % 4;
  } else if (dir == 2) {
    x -= incr;
    if (x - radius < 0) 
      dir = (dir + 1) % 4;
  } else {
    y -= incr;
    if (y - radius < 0) 
      dir = (dir + 1) % 4;
  }
   circle(x,y,diameter);
}

float findE(int n) {
  float res = 0;
  int fact = 1;
  for (int i = 1; i <= n; i++) {
    res += 1./fact;
    fact *= i;
  }
  return res;
}

/*
println(findE(9));
// -> returns 2.718279
// actual value of e: 2.71828182
*/
