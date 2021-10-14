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
