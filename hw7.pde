int[] xs = new int[120];
int[] ys = new int[120];
int recorded = 0;

int state = 0; // 0 = doing nothing yet, 1 = recording, 2 = displaying

int radius_recording = 4;
int radius_displaying = 10;
boolean display_forward = true;

void setup() {
  size(600,400);
  background(200);
  frameRate(60);
}

void mousePressed() {
  if (state == 0) state = 1;
}

void draw() {
  if (state == 0) return;
  if (frameCount == 120 && state != 2) {
    state = 2;
    background(200);
    frameCount -= 120;
  }
  if (state == 1) {
    xs[frameCount] = mouseX;
    ys[frameCount] = mouseY;
    circle(mouseX, mouseY, radius_recording);
  }
  if (display_forward) {
    fill(0,255,0);
    circle(xs[frameCount % 120], ys[frameCount % 120], radius_displaying);
  }
  if (frameCount % 120 == 0) {
    background(200);
    display_forward = !display_forward;
  }
  if (!display_forward) {
    fill(255,0,0);
    circle(xs[119 - frameCount % 120], ys[119 - frameCount % 120], radius_displaying);
  }
// your excellent code here
}
