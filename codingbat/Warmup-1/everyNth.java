public String everyNth(String str, int n) {
  String newstr = "";
  for (int i = 0; i < str.length(); i += n) {
    newstr += str.charAt(i);
  }
  return newstr;
}
