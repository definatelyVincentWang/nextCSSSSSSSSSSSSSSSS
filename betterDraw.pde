class Palette {
  float x;
  float y;
  float side;
  color c;
  
  Palette(float x, float y, float side, color c) {
    this.x = x;
    this.y = y;
    this.side = side;
    this.c = c;
  }
  
  boolean checkIntersect() {
    boolean intersectX = mouseX >= x && mouseY <= x + side;
    boolean intersectY = mouseY >= y && mouseY <= y + side;
    return intersectX && intersectY;
  }
  void display() {
    fill(c);
    square(x,y,side);
  }
}

Palette[] boxes;
float prevX, prevY;
int prevFrame;

void setup() {
  size(1200,900);
  String[] colorStrings = {"R","G","B","RG","Rg","RB","Rb","rG","GB","Gb","rB","gB",""};
  boxes = new Palette[colorStrings.length];
  
  int x = 20;
  int y = 20;
  for (int i = 0; i < boxes.length; i++) {
    boxes[i] = new Palette(x,y,width/boxes.length / 2, convertColors(colorStrings[i]));
    x += width / boxes.length;
  }
}

void draw() {
  for (Palette box : boxes) {
    box.display();
    if (box.checkIntersect() && mousePressed) {
      stroke(box.c);
    }
  }
  if (mousePressed) {
    if (frameCount == prevFrame + 1) {
      line(prevX,prevY,mouseX,mouseY);
    }
    prevX = mouseX;
    prevY = mouseY;
    prevFrame = frameCount;
  }
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
}

color convertColors(String c) {
  int[] res = new int[3];
  for (int i = 0; i < c.length(); i++) {
    char curColor = c.charAt(i);
    char upper = Character.toUpperCase(curColor);
    int pos = 0;
    if (upper == 'R') {
      pos = 0;
    } else if (upper == 'G') {
      pos = 1;
    } else {
      pos = 2;
    }
    // 90 is the ascii value of Z
    if (curColor > 90) {
      res[pos] += 180;
    } else {
      res[pos] += 255;
    }
  }
  return color(res[0], res[1], res[2]);
}
