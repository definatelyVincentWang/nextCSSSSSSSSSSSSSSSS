

void setup() {
  
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

