class Hand {
  int n, selected;
  Card[] inHand = new Card[0];

  Hand() {
    n = 0;
    selected = -1;
  }

  boolean drawCard(Card c) {
    if (n >= 10) return false;
    append(inHand, c);
    return true;
  }

  int select() {
    for(int i = 0; i < n; i++){ 
      // x value of each card will be 
      // wdith / 2 - (# card * 0.5  * card.width)
      // y value is: height - 150
      if ((mouseX > width / 2 - (n * 0.5 * inHand[i].WIDTH) + i * inHand[i].WIDTH && mouseX < width / 2 - (n * 0.5 * inHand[i].WIDTH) + (i + 1) * inHand[i].WIDTH) && (mouseY > height - 150 && mouseY < height)) {
        if(selected != i){ //new card selected
            selected = i;
            return i;
        } else {
            selected = -1;
            return i;
        }
      }
    }
    return -1;
  }

  void remove(int i) {
    for (int pos = i + 1; pos < inHand.length; pos++) {
      inHand[pos - 1] = inHand[pos];
    }
  }

  void display() {
    // draw
    for(int i = 0; i < n; i++) {
        stroke(5);
        rect(width / 2 - (n * 0.5 * inHand[i].WIDTH) + i * inHand[i].WIDTH, height-150, inHand[i].WIDTH, inHand[i].HEIGHT);
        image(inHand[i].img, width / 2 - (n * 0.5 * inHand[i].WIDTH) + i * inHand[i].WIDTH, height-150, inHand[i].WIDTH, inHand[i].HEIGHT);
    }
  }
}
