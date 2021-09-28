public String delDel(String str) {
  if (str.length() < 4) return str;
  return str.substring(1,4).equals("del") ? str.substring(0,1) + str.substring(4, str.length()) : str;
}
