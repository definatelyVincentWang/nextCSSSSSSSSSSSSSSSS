void setup() {
  size(400,400);
  background(119,221,130);
}

void draw() {
  // outline da rolex
  background(119,221,119);
  fill(255,215,0);
  stroke(0,0,0);
  
  fill(192,192,192);
  rect(150 * cos(4 * PI/3) + 200, 150 * sin(4 * PI/3)+ 200, (150 * cos(-PI/3) + 200)-(150 * cos(4 * PI/3) + 200), -100);
  rect(150 * cos(2*PI/3) + 200,150 * sin(2*PI/3)+ 200,(150 * cos(PI/3) + 200) - (150 * cos(2*PI/3) + 200), 500);
  
  strokeWeight(50);
  stroke(255,215,0);
  line(150 * cos(-PI/2) + 200, 150 * sin(-PI/2)+ 200, 150 * cos(-PI/2)+ 200, 150 * sin(-PI/2));
  line(150 * cos(PI/2) + 200, 150 * sin(PI/2)+ 200, 150 * cos(PI/2)+ 200, 150 * sin(PI/2) + 400);
  strokeWeight(10);
  stroke(192,192,192);
  fill(255,215,0);
  circle(200,200,300);
  
  strokeWeight(1);
  stroke(0);
  
  // second
  line(200,200,200 + 140 * cos((2 * PI / 60) * second()), 200 + 140 * sin((2 * PI / 60) * second()));
  // minute
  line(200,200,200 + 120 * cos((2*PI / (60 * 60)) * minute()),200 + 120 * sin((2*PI / (60 * 60)) * minute()));
  // hour
  line(200,200,200 + 100*cos((2*PI / (60 * 60 * 12)) * hour()),200 + 100*sin((2*PI / (60 * 60 * 12)) * hour()));
  delay(1000);
}
