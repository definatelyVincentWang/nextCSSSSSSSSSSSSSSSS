void setup() {
  size(500,400);
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = color(255);
  }
  for (int i = 0; i < width; i++) {
    pixels[height/2 * width + i] = color(255,0,0);
  }
  for (int i = 0; i < height; i++) {
    pixels[i * width + width/2] = color(0,0,255);
  }
  updatePixels();
}
