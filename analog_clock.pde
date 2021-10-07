int s;
int h;
int m;

void setup() {
  size(400,400);
  background(119,221,119);
  
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
}

void draw() {
  // outline da rolex
  background(119,221,119);
  fill(255,215,0);
  stroke(0,0,0);
  
  rect(150 * cos(4 * PI/3) + 200, 150 * sin(4 * PI/3)+ 200, (150 * cos(-PI/3) + 200)-(150 * cos(4 * PI/3) + 200), -100);
  rect(150 * cos(2*PI/3) + 200,150 * sin(2*PI/3)+ 200,(150 * cos(PI/3) + 200) - (150 * cos(2*PI/3) + 200), 500);
  
  strokeWeight(50);
  stroke(192,192,192);
  line(150 * cos(-PI/2) + 200, 150 * sin(-PI/2)+ 200, 150 * cos(-PI/2)+ 200, 150 * sin(-PI/2));
  line(150 * cos(PI/2) + 200, 150 * sin(PI/2)+ 200, 150 * cos(PI/2)+ 200, 150 * sin(PI/2) + 400);
  strokeWeight(10);
  circle(200,200,300);
  
  while(second() != s + 1) {
    continue;
  }
  s++;
  // second
  // value to increase every second: 2PI / 60
  //line();
  // minute
  // value to increase every minute: 2PI / 60
  //line();
  // hour
  // value to increase hour every second: 2PI / (60 * 60)
  //line();
}
