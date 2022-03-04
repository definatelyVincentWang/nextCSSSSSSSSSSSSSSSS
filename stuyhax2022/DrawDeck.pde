class DrawDeck {
  Card[] deck;
  final int MAXCARDS = 15;
  PImage image = createImage(width - 70, height / 2 - 40, "data/deck.png");

  DrawDeck() {
    deck = new Card[0];
  }

  void addCard(Card c) {
    append(deck, c);
  }

  void display() {
    loadImage(image, 50, 100);
  }

  void removeCard() {
    deck.remove(deck[0]);
  }
}
