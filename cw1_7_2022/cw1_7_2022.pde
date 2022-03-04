PShape head, torso, fred, p;
void setup() {
  size(500, 500);
  translate(width/2, height/2);
  rotate(PI/6);
  torso = createShape(RECT, -25, -100, 50, 200);
  torso.setFill(color(255,0,0));
  head = createShape(ELLIPSE, 0, -125, 50, 50);
  fred = createShape(GROUP);
  fred.addChild(head);
  fred.addChild(torso);
  shape(fred);
  
  p = createShape();
  p.beginShape();
  p.vertex(25,12);
  p.vertex(50,-100);
  p.vertex(60,40);
  p.endShape(CLOSE);
  shape(p);
}
