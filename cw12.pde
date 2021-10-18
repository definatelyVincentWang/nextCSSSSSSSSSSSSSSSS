int x;
int y;
int radius;
float angle;

void setup() {
  size(400,400);
  x = 200;
  y = 200;
  frameRate(120);
  radius = 50;
  angle = random(0, 360);
  background(0);
  frameRate(60);
}
void draw() {
  background(0);
  x += 2 * cos(radians(angle));
  y += 2 * sin(radians(angle));
  if (x - radius <= 0 || x + radius >= width) {
    angle = 180 - angle;
  }
  if (y - radius <= 0 || y + radius >= height) {
    angle =  -angle;
  }
  circle(x,y,radius*2);
}
