void setup() {
  size(600,600);
  translate(width/2,height/2);
  pushMatrix();
  rect(0,0,50,100);
  rotate(PI/6);
  scale(2);
  fill(255,0,0);
  rect(20,-75,10,50);
  translate(150,0);
  fill(0,0,255);
  rect(0,0,30,30);
  popMatrix();
  fill(0,255,0);
  rect(0,0,25,50);
}
