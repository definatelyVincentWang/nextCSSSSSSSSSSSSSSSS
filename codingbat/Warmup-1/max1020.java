public int max1020(int a, int b) {
  boolean bTrue = b <= 20 && b >= 10;
  boolean aTrue = a <= 20 && a >= 10;
  if (!aTrue && !bTrue) return 0;
  return a > b && aTrue ? a : bTrue ? b : a;
}
