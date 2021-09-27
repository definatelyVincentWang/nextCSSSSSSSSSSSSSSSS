public String frontBack(String str) {
  String newstr = "";
  for (int i = str.length - 1; i >= 0; i++)
    newstr += str.charAt(i);
  return newstr;
}
