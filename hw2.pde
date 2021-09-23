// Vincent Wang
// nextCS hw#: 2
// 9/23/21

// mirage of rectangles

size(700, 500);

// set max of length and width
int maxX = 151;
int maxY = 76;

// set max possible x and y coordinates
int sizeX = 701;
int sizeY = 501;

// max possible color value
int maxC = 256;

// create a rectangle in a random location of random size and color i times
for (int i = 0; i < 400; i++) {
  color c = color(random(maxC),random(maxC),random(maxC),random(maxC));
  fill(c);
  rect(random(sizeX), random(sizeY), random(30, maxX), random(30, maxY));
}

println("Done!");
