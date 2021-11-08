float prevX, prevY;
int prevFrame;

void setup() {
  size(400,400);
  background(0);
  prevFrame = 0;
}

void draw() {
  if (frameCount > prevFrame && mousePressed) {
    line(prevX,prevY, mouseX, mouseY);
    prevFrame = frameCount;
    prevX = mouseX;
    prevY = mouseY;
  }
}

void mousePressed() {
  prevX = mouseX;
  prevY = mouseY;
  stroke(255);
  prevFrame = frameCount;
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
}
