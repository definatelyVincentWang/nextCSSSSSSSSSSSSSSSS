void setup() {
  noLoop();
}

void draw() {
  println(CoolEuler(100) - PI/6.);
  // -> should print 1.1113852
  println(Harmony(20.));
  // -> should print 272400582
  AllOfThem();
  /* -> Should print:
  2
  3
  5
  7
  11
  13
  17
  19
  23
  29
  31
  37
  41
  43
  47
  53
  59
  61
  67
  71
  73
  79
  83
  89
  97
  */
}

float CoolEuler(int n) {
  // create a variable to save the sum of all the 1/x^2 for all x [1,n].
  float res = 0;
  for (int i = 1; i <= n; i++) {
    // iterate and add each 1/i^2 value to res
    res += 1. / pow(i,2);
  }
  return res;
}

int Harmony(float sum) {
  // create a variable to save the sum of all 1/i for all i [1,infiniti)
  double res = 0;
  // create a variable to save the current denominator
  int denominator = 1;
  while (res < sum) {
    // add each value to res
    res += 1. / denominator;
    denominator++;
  }
  return denominator;
}

void AllOfThem() {
  for (int i = 2; i <= 100; i++) {
    // check to make sure you are not dividing a number by itself
    if (i == 2 || i == 3 || i == 5 || i == 7) {
      // if you are, print the number and then skip the rest of the arguments.
      println(i);
      continue;
    }
    // check if number is not divisible by 2, 3, 5, or 7
    if (i % 2 != 0 && i % 3 != 0 && i % 5 != 0 && i % 7 != 0) {
      // if it is, then it must be prime
      println(i);
    }
  }
}
