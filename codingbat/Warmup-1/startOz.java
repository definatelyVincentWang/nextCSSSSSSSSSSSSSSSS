public String startOz(String str) {
  String i = "";
  if (str.length() < 2) return str;
  if (str.charAt(0) == 'o') i += str.charAt(0);
  if (str.charAt(1) == 'z') i += str.charAt(1);
  return i;
}
