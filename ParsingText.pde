void setup() {
  //String[] lines = loadStrings("ParsingText.txt");
  String[] lines = loadStrings("http://bert.stuy.edu/pbrooks/fall2021/materials/nextcs-1/flexarray/travel.txt");
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


/*
Res:


Travel
By Edna St. Vincent Millay

The railroad track is miles away,
And the day is loud with voices speaking,
Yet there isn't a train goes by all day
But I hear its whistle shrieking.

All night there isn't a train goes by,
Though the night is still for sleep and dreaming,
But I see its cinders red on the sky,
And hear its engine steaming.

My heart is warm with the friends I make,
And better friends I'll not be knowing;
Yet there isn't a train I wouldn't take,
No matter where it's going.
*/
