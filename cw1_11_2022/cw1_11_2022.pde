PImage image;
int frameRate = 60;
float[] factors = new float[256];

void setup() {
  size(1920,1200);
  frameRate(frameRate);
  image = loadImage("index.jpeg");
  image.resize(width,height);
  image(image,0,0);
}

void draw() {
  int time = 1;
  int fr = frameRate * time;
  for (int i = 1; i < factors.length; i++) {
    factors[i] = pow(1 / i, 1 / fr);
  }
  fadeLinear(fr);
  //fadeExponential();
}

void fadeExponential() {
  loadPixels();
  image.loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    int R = int(red(pixels[i]) * factors[(int)red(pixels[i])]);
    int G = int(green(pixels[i]) * factors[(int)green(pixels[i])]);
    int B = int(blue(pixels[i]) * factors[(int)blue(pixels[i])]);
    pixels[i] = color(R,G,B);
  }
  updatePixels();
}

void fadeLinear(int fr) {
  image.loadPixels();
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    int diffR = (int)red(image.pixels[i]) / fr;
    int diffG = (int)green(image.pixels[i]) / fr;
    int diffB = (int)blue(image.pixels[i]) / fr;
    pixels[i] = color(red(pixels[i]) - diffR, green(pixels[i]) - diffG, blue(pixels[i]) - diffB);
  }
  updatePixels();
}

void move() {
  loadPixels();
  int[] save = new int[height];
  for (int mv = 0; mv < height; mv++) {
    save[mv] = pixels[width * mv + width - 1];
  }
  for (int i = width - 2; i >= 0; i--) {
    for (int j = 0; j < height; j++) {
      pixels[i + 1 + j * width] = pixels[i + j * width];
    }
  }
  for (int i = 0; i < height; i++) {
    pixels[i * width] = save[i];
  }
  updatePixels();
}
