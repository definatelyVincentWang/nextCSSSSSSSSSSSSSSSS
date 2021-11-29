void setup() {
  String[] lines = loadStrings("ParsingText.txt");
  String[] res = new String[lines.length];
  for (String i : lines) {
    String[] split = split(i," ");
    res[int(split[0])] = split[1];
  }
  for (String i : res) {
    if (i.equals("{NL}")) {
      println();
    } else {
      print(i + " ");
    }
  }
}
