public String front3(String str) {
  int front = Math.min(3, str.length());
  return str.substring(0,front) + str.substring(0,front) + str.substring(0,front);
}
