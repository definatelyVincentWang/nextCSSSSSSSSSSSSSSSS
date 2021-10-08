void setup() {
  size(400,400);
  background(119,221,130);
}

void draw() {
  background(119,221,119);
  // outline da rolex
  fill(255,215,0); 
  stroke(0,0,0);
  fill(192,192,192);
  rect(150 * cos(4 * PI/3) + 200, 150 * sin(4 * PI/3)+ 200, (150 * cos(-PI/3) + 200)-(150 * cos(4 * PI/3) + 200), -100);
  rect(150 * cos(2*PI/3) + 200,150 * sin(2*PI/3)+ 200,(150 * cos(PI/3) + 200) - (150 * cos(2*PI/3) + 200), 500);
  strokeWeight(50);
  stroke(255,215,0);
  line(150 * cos(-PI/2) + 200, 150 * sin(-PI/2)+ 200, 150 * cos(-PI/2)+ 200, 150 * sin(-PI/2));
  line(150 * cos(PI/2) + 200, 150 * sin(PI/2)+ 200, 150 * cos(PI/2)+ 200, 150 * sin(PI/2) + 400);
  // make the watch case
  strokeWeight(10);
  stroke(192,192,192);
  fill(255,215,0);
  circle(200,200,300);
  
  // make the time tuner
  rect(150*cos(0)+2.5, 150 * sin(0), 10,10);
  
  // make a circle to say pm or am
  strokeWeight(1);
  stroke(255,255,255);
  fill(255,255,255);
  circle(200,300, 30);
  // draw arc but idk how 2
  stroke(0,0,0);
  fill(0,0,0);
  arc(200,300,30,30,0,PI);
  stroke(255,215,0);
  float timeOfDay = map(hour(), 0, 23, 0, 2*PI);
  line(200,300, 200 + 15 * cos(timeOfDay), 300 + 15 * sin(timeOfDay));
  
  // make the ticks
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
