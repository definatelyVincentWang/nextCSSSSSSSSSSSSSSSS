int x,y;
float dx, dy;
int radius;

void setup() {
  background(0);
  size(400,400);
  x = 200;
  y = 200;
  frameRate(30);
  radius = 50;
  dx = random(-10,10);
  dy = random(-10,10);
}
void draw() {
  background(0);
  x += dx;
  y += dy;
  if (x - radius <= 0 || x + radius >= width) {
    dx = -dx;
  }
  if (y - radius <= 0 || y + radius >= height) {
    dy = -dy;
  }
  circle(x,y,radius*2);
}
