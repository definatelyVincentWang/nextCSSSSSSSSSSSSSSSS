public String delDel(String str) {
  return str.substring(1,4).equals("del") ? str.substring(0,1) + str.substring(5, str.length()) : str;
}
