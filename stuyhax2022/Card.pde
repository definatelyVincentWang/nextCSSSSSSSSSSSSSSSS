class Card {
  float WIDTH = 80, HEIGHT = 150,;
  int manaCost, attack, health, ability;
  int state = 0;
  String img;
  Card(String cardImage, int manaCost, int attack, int health, int ability){
    img = cardImage;
    this.manaCost = manaCost;
    this.attack = attack;
    this.health = health;
    this.ability = ability;
  }

  void display(int pos) {
    if (state == 0) {
      PImage img = createImage(240 + pos * width, height - HEIGHT, cardImage);
      //cardImage
      loadImage(cardImage, WIDTH, HEIGHT);
    } else if (state == 1) {
      PImage img = createImage();
    }
  }
}
