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
