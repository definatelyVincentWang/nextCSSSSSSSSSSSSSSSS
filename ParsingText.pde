void setup() {
  String[] lines = loadStrings("ParsingText.txt");
  //String[] lines = loadStrings("http://bert.stuy.edu/pbrooks/fall2021/materials/nextcs-1/%22http:/bert.stuy.edu/pbrooks/fall2021/materials/nextcs-1/flexarray/travel.txt%22");
  String[] res = new String[lines.length];
  for (String i : lines) {
    String[] split = split(i," ");
    res[int(split[0])] = split[1];
  }
  boolean firstWord = true;
  for (String i : res) {
    if (i.equals("{NL}")) {
      println();
      firstWord = true;
    } else {
      if (firstWord) {
        print(i);
        firstWord = false;
      } else {
        print(" " + i);
      }
    }
  }
}
