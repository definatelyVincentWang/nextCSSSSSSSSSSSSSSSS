public boolean stringE(String str) {
  int x = 0;
  for (int i = 0; i < str.length(); i++) {
    x += str.charAt(i) == 'e' ? 1 : 0;
  }
  return x >= 1 && x <= 3;
}
