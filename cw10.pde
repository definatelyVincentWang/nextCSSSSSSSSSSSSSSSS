class pain {
  int painLevel;
  public pain(int painLevel) {
    this.painLevel = painLevel;
  }
  void lifePain() {
    println("Life is pain");
  }
  void setPain(int newPain) {
    painLevel = newPain;
  }
  int getPain() {
    return painLevel;
  }
  boolean isVeryPain() {
    return painLevel > 10000;
  }
  boolean isDead() {
   return painLevel > Integer.MAX_VALUE; // never possible so never dead :(
  }
}

void setup() {
  pain PAIN = new pain(10000);
  PAIN.lifePain();
  PAIN.setPain(Integer.MAX_VALUE);
  println("MY PAIN LEVEL IS " + PAIN.getPain());
  
  println(isPrime(23));
  
  println(checkPrimes(100)[23] == 0);
  int n = 10000;
  int[] primes = checkPrimes(sqrt(n));
  // new prime function to divide by all primes
}

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

boolean isPrime(int n) {
    for (int i = 2; i < sqrt(n) + 1; i++) {
      if (n % i == 0) return false;
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
