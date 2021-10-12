PFont textfont;

void setup() {
  size(400,400);
  background(255,255,255);
  textfont = createFont(PFont.list()[10], 15);
  textFont(textfont);
}

void draw() {
  background(255,255,255);
  // outline da rolex
  fill(255,215,0); 
  stroke(0,0,0);
  fill(34,34,34,255);
  rect(150 * cos(4 * PI/3) + 200, 150 * sin(4 * PI/3)+ 200, (150 * cos(-PI/3) + 200)-(150 * cos(4 * PI/3) + 200), -100);
  rect(150 * cos(2*PI/3) + 200,150 * sin(2*PI/3)+ 200,(150 * cos(PI/3) + 200) - (150 * cos(2*PI/3) + 200), 500);
  strokeWeight(50);
  
  /*
  // multi color wrist band?
  stroke(255,215,0);
  line(150 * cos(-PI/2) + 200, 150 * sin(-PI/2)+ 200, 150 * cos(-PI/2)+ 200, 150 * sin(-PI/2));
  line(150 * cos(PI/2) + 200, 150 * sin(PI/2)+ 200, 150 * cos(PI/2)+ 200, 150 * sin(PI/2) + 400);
  */
  
  // make the watch case
  strokeWeight(10);
  stroke(200,156,118,255);
  fill(54,69,79);
  circle(200,200,300);
  
  // make a circle to say pm or am
  int timeX = 185;
  int timeY = 260;
  int D = 60;
  strokeWeight(1);
  stroke(200,156,118,255);
  fill(0,0,0);
  circle(timeX,timeY, D);
  // draw arc but idk how 2
  stroke(200,156,118,255);
  fill(255,255,255);
  arc(timeX,timeY,D,D,0,PI);
  stroke(200,156,118,255);
  float timeOfDay = map(hour(), 0, 24, 0, 2 * PI);
  line(timeX,timeY, timeX + D/2 * cos(timeOfDay), timeY + D/2 * sin(timeOfDay));
  
  fill(0,0,0);
  
  // make da logo
  int monthX = 200;
  int monthY = 120;
  D = 20;
  circle(monthX,monthY, D);
  for(int i = 0; i < 12; i++) {
    float theta = PI/6 * i;
    
    float oldX = monthX + D/2 * cos(theta);
    float oldY = monthY + D/2 * sin(theta);
    
    float x = monthX + D/2 - 10 * cos(theta);
    float y = monthY + D/2 - 10 * sin(theta);
    line(oldX, oldY, x, y);
  }
  
  text("Sputnik", 176, 150);
  
  // make a circle say month
  monthX = 150;
  monthY = 180;
  D = 60;
  circle(monthX,monthY, D);
  for(int i = 0; i < 12; i++) {
    float theta = PI/6 * i;
    
    float oldX = monthX + D/2 * cos(theta);
    float oldY = monthY + D/2 * sin(theta);
    
    float x = monthX + (D/2 - 10) * cos(theta);
    float y = monthY + (D/2 - 10 ) * sin(theta);
    line(oldX, oldY, x, y);
  }
  float theta = map(month(), 0,12, -PI/2, 3 * PI / 2);
  line(monthX, monthY, monthX + D/2 * cos(theta), monthY + D/2 * sin(theta));
  
  // make a circle say dates
  int dayX = 265;
  int dayY = 200;
  D = 80;
  circle(dayX,dayY,D);
  for(int i = 0; i < 32; i++) {
    theta = PI/16 * i;
    float oldX = dayX + D/2 * cos(theta);
    float oldY = dayY + D/2 * sin(theta);
    
    float x = dayX + (D/2 - 10) * cos(theta);
    float y = dayY + (D/2 - 10 ) * sin(theta);
    line(oldX, oldY, x,y);
  }
  
  theta = map(day(), 0,32, -PI/2, 3 * PI / 2);
  line(dayX, dayY, dayX + D/2 * cos(theta), dayY + D/2 * sin(theta));
  
  // make the ticks
  strokeWeight(1.5);
  stroke(40);
  for(int i = 0; i < 12; i++) {
    theta = PI/6 * i;
    if (theta == PI/2 || theta == 3 * PI / 2 || theta == 0 || theta == PI) {
      stroke(200,156,118,255);
      strokeWeight(5);
    }
    float oldX = 200 + 120 * cos(theta);
    float oldY = 200 + 120 * sin(theta);
    
    float x = 200 + 140 * cos(theta);
    float y = 200 + 140 * sin(theta);
    line(oldX, oldY, x,y);
    stroke(40);
    strokeWeight(1.5);
  }
  
  // make da sun
  noStroke();
  fill(249,215,29);
  circle(200,200,35);
  
  // position of earth on the ecliptic
  int orbitX = 200;
  int orbitY = 200;
  D = 215;
  noFill();
  stroke(135, 206, 235);
  circle(orbitX, orbitY, D);
  theta = map(month(), 0,12, -PI/2, 3 * PI/2) + map(day(), 0, 32, 0, PI/6);
  float earthX = orbitX + D / 2 * cos(theta);
  float earthY = orbitY + D / 2 * sin(theta);
  D = 25;
  fill(34,59,5);
  noStroke();
  circle(earthX, earthY, D);
  
  // moon orbit
  noFill();
  stroke(253,253,150);
  D = 40;
  circle(earthX, earthY, D);
  theta = map(hour(), 0, 24, - PI / 2, 3 * PI / 2) + map(minute(), 0, 60, 0, PI / 12);
  float moonX = earthX + D / 2 * cos(theta);
  float moonY = earthY + D / 2 * sin(theta);
  D = 10;
  fill(49, 48, 46);
  noStroke();
  circle(moonX, moonY, D);
  
  // second
  stroke(200,156,118,255);
  float radiansS = (2*PI/60) * second() - PI / 2;
  strokeWeight(1);
  line(200,200,200 + 140 * cos(radiansS), 200 + 140 * sin(radiansS));
  // minute
  strokeWeight(2);
  float radiansM = ((2*PI/60) * minute() - PI/2) + ((2*PI/(60*60)) * second());
  line(200,200,200 + 120 * cos(radiansM),200 + 120 * sin(radiansM));
  // hour
  strokeWeight(3);
  float radiansH = ((2*PI/12) * hour() - PI/2) + ((2*PI/(12*60)) * minute()) + ((2*PI/(12*60*60)) * second());
  line(200,200,200 + 100*cos(radiansH),200 + 100*sin(radiansH));
  delay(1000);
}
