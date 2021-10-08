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
  stroke(0,0,0);
  for(int i = 0; i < 12; i++) {
    float theta = PI/6 * i;
    float oldX = 200 + 125 * cos(theta);
    float oldY = 200 + 125 * sin(theta);
    
    float x = 200 + 135 * cos(theta);
    float y = 200 + 135 * sin(theta);
    line(oldX, oldY, x,y);
  }
  
  strokeWeight(1);
  stroke(0);
  
  // second
  float radiansS = (2*PI/60) * second() - PI / 2;
  line(200,200,200 + 140 * cos(radiansS), 200 + 140 * sin(radiansS));
  // minute
  float radiansM = ((2*PI/60) * minute() - PI/2) + ((2*PI/(60*60)) * second());
  line(200,200,200 + 120 * cos(radiansM),200 + 120 * sin(radiansM));
  // hour
  float radiansH = ((2*PI/12) * hour() - PI/2) + ((2*PI/(12*60)) * minute()) + ((2*PI/(12*60*60)) * second());
  line(200,200,200 + 100*cos(radiansH),200 + 100*sin(radiansH));
  delay(1000);
}
