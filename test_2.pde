class Card {
  float x;
  float y;
  float w;
  float h;
  int value;
  
  Card(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    value = (int)random(2,11);
  }
  void display() {
    rect(x,y,w,h);
    float circleX = x + w / 2.;
    float incrY = (float)h / value;
    float circleY = y + incrY / 2;
    for (int curValue = 0; curValue < value; curValue++) {
      circle(circleX, circleY, incrY);
      circleY += incrY;
    }
  }
  boolean compare(Card other) {
    return w * h > other.w * other.h;
  }
}

void setup() {
  size(400,400);
  Card i = new Card(100,100,100,200);
  println(i.value);
  i.display();
}
