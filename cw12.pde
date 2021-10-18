int x;
int y;
int radius;
float angle;

void setup() {
  size(400,400);
  x = 200;
  y = 200;
  radius = 50;
  angle = random(0, 360);
  background(0);
  frameRate(60);
}
void draw() {
  angle = angle % 360;
  if (angle < 0) {
    angle = 360 - angle;
  }
  background(0);
  x += 5 * cos(radians(angle));
  y += 5 * sin(radians(angle));
  if (x - radius <= 0 || x + radius >= width) {
    angle = 180 + angle;
  }
  if (y - radius <= 0 || y + radius >= height) {
    angle = 360 - angle;
  }
  println(angle);
  circle(x,y,radius);
}
