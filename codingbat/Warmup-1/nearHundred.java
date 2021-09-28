public boolean nearHundred(int n) {
  int hundred = Math.abs(n - 100);
  int twohundred = Math.abs(n - 200);
  return hundred <= 10 || twohundred <= 10 ? true : false;
}
