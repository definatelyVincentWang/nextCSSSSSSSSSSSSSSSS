size(400,600);
int xValue = 400;
int yValue = 600;

void setup() {
  Gid(5,6);
}

void Gid(int columns, int rows) {
  for(int x = 0; x <= xValue; x += xValue / columns) {
    for (y = 0; y <= yValue; y += xValue / rows) {
      rect(x,y, xValue / columns, yValue / rows);
      circle(x + xValue / columns / 2, y + yValue / rows / 2, min(xValue, yValue));
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

