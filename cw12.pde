float x,y;
float velx,vely;
int radius;

void setup() {
  size(400,400);
  x = 200;
  y = 200;
  float angle = random(0,2 * PI);
  velx = 5 * cos(angle);
  vely = 5 * sin(angle);
  frameRate(120);
  radius = 50;
  background(0);
  frameRate(60);
}
void draw() {
  background(0);
  x += velx;
  y += vely;
  if (x - radius <= 0 || x + radius >= width) {
    velx = -velx;
  }
  if (y - radius <= 0 || y + radius >= height) {
    vely = -vely;
  }
  circle(x,y,radius*2);
}
