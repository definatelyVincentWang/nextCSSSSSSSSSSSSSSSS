int xValue;
int yValue;

void setup() {
  size(600,400);
  strokeWeight(2);
  fill(255,255,255);
  xValue = 600;
  yValue = 400;
  Gid(5,6);
  
  println(Nest(0));
  // -> returns 0
  println(Nest(1));
  // -> returns 1
  println(Nest(2));
  // -> returns 4
  println(Nest(3));
  // -> returns 10
  println(Nest(4));
  // -> returns 20
}

void Gid(int columns, int rows) {
  for(float x = 0; x <= xValue; x += (float)xValue / columns) {
    for (float y = 0; y <= yValue; y += (float)yValue / rows) {
      line(x,0,x, yValue);
      line(0,y,xValue,y);
      circle(x + xValue / columns / 2, y + yValue / rows / 2, min(xValue / columns / 3 * 2, yValue / rows / 3 * 2));
    }
  }
}

int Nest(int n) {
  int res = 0;
  for (int i = 0; i <= n; ++i) {
    int sum = 0;
    for (int j = 0; j <= i; ++j) {
      sum += j;
    }
    res += sum;
  }
  return res;
}
