float x,y;
float xvel,yvel;
float g, f;

void setup() {
  frameRate(60);
  x = -80;
  y = 70;
  
  float angle = random(PI/2);
  
  float vel = 1.5;
  xvel = vel * cos(angle);
  yvel = vel * sin(angle);
  
  g = 0.1;
  f = 0.9;
  
  size(400,400);
}

void draw() {
  background(0);
  x += xvel;
  y += yvel;
  
  circle(map(x, -100, 100, 400, 0),map(y, -100, 100, 400, 0),5);
  
  yvel -= g;
  
  if (y - 5 <= -100) {
    yvel = - (yvel * f);
  }
  
  if (x + 5 >= 100 || x - 5 <= -100) {
    xvel = -xvel;
  }
}
