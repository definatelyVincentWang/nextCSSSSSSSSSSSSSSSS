class Card {
  float WIDTH = 80, HEIGHT = 150;
  int manaCost, attack, health, ability;
  int state = 0;
  String cardImage;
  int curY = 0;
  int prevY = 0;
  int subtract = 10;
  boolean firstTime = true;
  
  public Card(String cardImage, int manaCost, int attack, int health, int ability){
    this.cardImage = cardImage;
    this.manaCost = manaCost;
    this.attack = attack;
    this.health = health;
    this.ability = ability;
  }

  boolean display(int pos) {
    // do this if its still in your deck
    if (state == 0) {
      PImage img = loadImage(cardImage);
      //cardImage
      image(img, 240 + pos * WIDTH, height - HEIGHT, WIDTH, HEIGHT);
      // do this if its in the battlefield
    } else if (state == 1) {
      int y = pos / 4;
      int x = pos % 4;
      
      PImage img = loadImage(cardImage);
      image(img, width / 2 - WIDTH * 2 + x * WIDTH, height / 2 - HEIGHT * 2 + y * HEIGHT, WIDTH, HEIGHT);
    //   do this if its currently dying
  } else if (state == 2) {
      PImage img = loadImage(cardImage);
      fade(img);
      int y = pos / 4;
      int x = pos % 4;
      image(img, width / 2 - WIDTH * 2 + x * WIDTH, height / 2 - HEIGHT * 2 + y * HEIGHT, WIDTH, HEIGHT);
      // do this if its attacking
    } else if (state == 3) {
      if (firstTime) {
        int y = pos / 4;
        prevY = int(height / 2 - HEIGHT * 2 + y * HEIGHT);
        curY = int(height / 2 - HEIGHT * 2 + y * HEIGHT);
      }
      curY -= subtract;
      if (prevY - curY > 80) {
        subtract = -subtract;
      }
      if (curY - prevY > 80) {
        state = 4;
      }
      // do this if its dead
    } else {
      return false;
    }
    return true;
  }
  
  void fade(PImage image) {
    image.loadPixels();
    for (int i = 0; i < image.pixels.length; i++) {
      pixels[i] = color(red(pixels[i]) - 10, green(pixels[i]) - 10, blue(pixels[i]) - 10);
    }
    updatePixels();
  }
  
  void attacking() {
    
  }
}
