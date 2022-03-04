PImage img;

void setup() {
  size(800,800);
  img = loadImage("Car.jpg");
  img.resize(width,height);
  image(img,0,0);
}

void draw() {
  loadPixels();
  int[] temp = new int[pixels.length];
  arrayCopy(pixels,temp);
  line(0,0,width,height);
  arrayCopy(temp,pixels);
  updatePixels();
}
