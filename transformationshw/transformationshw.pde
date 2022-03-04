color[] Colors = { color(255,0,0),  // red
                  color(255,180,180),
                  color(0,255,0),  // green
                  color(180,255,180),
                  color(0,0,255),  // blue
                  color(180,180,255)} ;
float[] Angles = {0,-PI/6,-PI/6,-PI/4,-PI/8,PI/2};  // initial (startup) angles
float[] Scales = {2,.5,1,.8,.5,1.5};  // scaling of each
float[] DeltaAngles = {0,-.01,-.02,.06,-.04,.08};  // additional angle on each draw()

void setup() {
  size(800,800);
  frameRate(60);
}

void draw() { //good stuff here
  translate(width / 2, height / 2);
  background(200);
  pushMatrix();
  float totAngle = 0;
  for (int i = 0; i < Scales.length; i++) {
    totAngle += Angles[i];
    display(totAngle, Scales[i], Colors[i], false);
    //display(Angles[i], Scales[i], Colors[i], false);
    Angles[i] -= DeltaAngles[i];
    if (i != 0)
      Angles[i] -= PI / 2;
    translate(100,0);
  }
  popMatrix();
  totAngle = 0;
  for (int i = 0; i < Scales.length; i++) {
    totAngle += Angles[i];
    display(totAngle, Scales[i], Colors[i], true);
    //display(Angles[i], Scales[i], Colors[i], false);
    translate(-100,0);
    if (i != 0)
      Angles[i] += PI / 2;
  }
}  

void display(float totAngle, float scale, color c, boolean left) {
  scale(scale);
  fill(c);
  if (left) {
    rotate(totAngle);
    ellipse(-45,0,130,10);
  } else {
    rotate(-totAngle);
    ellipse(45,0,130,10);
  }
  int crosshairSize = 3;
  float crosshairThickness = 0.1;
  fill(0);
  rect(0 - crosshairSize,0 - crosshairThickness,crosshairSize * 2,crosshairThickness * 2);
  rect(0 - crosshairThickness,0 - crosshairSize,crosshairThickness * 2,crosshairSize * 2);
}
