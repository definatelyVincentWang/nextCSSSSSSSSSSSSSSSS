void setup() {
  noLoop();
}

void draw() {
  println(CoolEuler(100) - PI/6.);
  // -> should print 1.1113852
  println(Harmony(20.));
  
  AllOfThem();
  // -> Should print all of the prime numbers from 1 - 100 (ex. 2,3,5,7,11,13,17,etc.)
}

float CoolEuler(int n) {
  float res = 0;
  for (int i = 1; i <= n; i++) {
    res += 1. / pow(i,2);
  }
  return res;
}

int Harmony(float sum) {
  float res = 0;
  int denominator = 1;
  while (res < sum) {
    res += 1. / denominator;
    denominator++;
  }
  return denominator;
}

void AllOfThem() {
  for (int i = 2; i <= 100; i++) {
    if (i == 2 || i == 3 || i == 5 || i == 7) {
      println(i);
      continue;
    }
    if (i % 2 != 0 && i % 3 != 0 && i % 5 != 0 && i % 7 != 0) {
      println(i);
    }
  }
}
