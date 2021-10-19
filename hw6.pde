float x,y;
float velx,vely;
int radius = 5;
float friction = 0.8;
float g = 0.1;

void setup() {
  frameRate(60);
  size(400,400);
  x = -80;
  y = 70;
  
  float angle = random(PI / 2);
  velx = 2 * cos(angle);
  vely = 2 * sin(angle);
}
void draw() {
  background(0);
  x += velx;
  y += vely;
  circle(map(x,-100,100,400,0),map(y,-100,100,400,0),radius * 2);
  
  vely -= g;
  
  if (x <= -100 || x + radius >= 100) {
    velx = -velx;
  }
  if (y <= -100+radius) {
    vely = abs(-vely * friction);
    y += vely;
  }
  //println(vely);
}
