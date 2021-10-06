float radians;
int radius;

void setup() {
  background(200);
  size(400,400);
  
  radians = 2 * PI;
  radius = 100;
}

void draw() {
  background(200);
  stroke(255,0,0);
  fill(0,0,0,0);
  circle(200,200,radius * 2);
  
  float circleX = 200 + cos(radians) * radius;
  float circleY = 200 + sin(radians) * radius;
  
  stroke(0,0,255);
  strokeWeight(2.0);
  line(200,200, circleX, circleY);
  stroke(0,0,0);
  strokeWeight(1.0);
  fill(255,255,255);
  circle(circleX, circleY, 80);
  
  radians -= PI / 140;
}
