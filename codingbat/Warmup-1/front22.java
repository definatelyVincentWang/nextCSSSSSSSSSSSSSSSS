public String front22(String str) {
  int front = Math.min(2, str.length());
  return str.substring(0, front) + str + str.substring(0, front);
}
