int x;
int y;
int radius;

void setup() {
  size(400,400);
  x = 200;
  y = 200;
  radius = 50;
  background(0);
  frameRate(60);
  //println(isPrime(23));
  
  /*
  //println(checkPrimes(100)[23] == 0);
  int n = 10000;
  int[] sift = checkPrimes((int)sqrt(n) + 1);
  ArrayList<Integer> primes = new ArrayList<Integer>();
  for (int i = 0; i < sift.length; i++) {
    if (sift[i] == 0) {
      primes.add(i);
    }
  }
  //checkPrimes(0,500,primes);
  // new prime function to divide by all primes
  isPrime(0, 500);
  */
}

void draw() {
  background(0);
  int increment = (int)random(-2 * PI, 2 * PI);
  x += 5 * cos(increment);
  y += 5 * sin(increment);
  if (x <= 0 || x >= 400) {
    x = 200;
  }
  if (y <= 0 || y >= 400) {
    y = 200;
  }
  circle(x,y,radius);
}

// sift
int[] checkPrimes(int lim) {
  int[] primes = new int[lim];
  for (int i = 0; i < primes.length; i++) {
    if (i == 0 || i == 1) {
      primes[i] = 1;
    }
    if (primes[i] == 0) {
      for (int multiply = 2; multiply * i < primes.length; multiply++) {
        primes[i * multiply] = 1;
      }
    }
  }
  return primes;
}

// check primes using sift
void checkPrimes(int min, int max, ArrayList<Integer> sift) {
  for (; min <= max; min++) {
    boolean isPrime = true;
    for (int check : sift) {
      if (min == check) {
        continue;
      }
      if (min % check == 0 || min == 1) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      println(min);
    }
  }
}

// smol brain check
boolean isPrime(int min, int max) {
    for (; min <= max; min++) {
      boolean isPrime = true;
      if (min == 1 || min == 0) {
        continue;
      }
      for (int divide = 2; divide < (int)sqrt(min) + 1; divide++) {
        if (min % divide == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        println(min);
      }
    }
    return true;
}
  
/*
Sieve of Atkins:

The algorithm completely ignores any numbers with remainder modulo 60 that is divisible by two, three, or five, since numbers with a modulo 60 remainder divisible by one of these three primes are themselves divisible by that prime.

All numbers n with modulo-sixty remainder 1, 13, 17, 29, 37, 41, 49, or 53 have a modulo-four remainder of 1. These numbers are prime if and only if the number of solutions to 4x2 + y2 = n is odd and the number is squarefree (proven as theorem 6.1 of[1]).

All numbers n with modulo-sixty remainder 7, 19, 31, or 43 have a modulo-six remainder of 1. These numbers are prime if and only if the number of solutions to 3x2 + y2 = n is odd and the number is squarefree (proven as theorem 6.2 of[1]).

All numbers n with modulo-sixty remainder 11, 23, 47, or 59 have a modulo-twelve remainder of 11. These numbers are prime if and only if the number of solutions to 3x2 − y2 = n is odd and the number is squarefree (proven as theorem 6.3 of[1]).

None of the potential primes are divisible by 2, 3, or 5, so they can't be divisible by their squares. This is why squarefree checks don't include 22, 32, and 52. 
*/
