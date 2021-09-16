import java.util.Random;

Random random = new Random();

// Getting used to the functions :)
/*
println();
 println takes a single String parameter and prints onto the console
 
 fill(365,365,365);
 fill sets the color used to fill shapes using R,G,B or uses a single int (no clue what dat does)
 
 line(6.9, 6.9, 4.2, 4.2);
 Draws a line from (x,y) to (x,y) using (x,y,x,y) (all floats)
 
 size(20,20);
 Sets the size of the window (x pixels, y pixels)
 
 background(365,365,365);
 Sets the color of the background (R, G, B) or uses a single int (no clue what dat does)
 
 circle(69, 69, 69);
 Creates a circle at (x,y) with radius z. Parameters: (x,y,z)
 
 stroke(365, 365, 365);
 sets the color used to draw lines or borders using R,G,B or uses a single int (no clue what dat does)
 */

println("This is my attempt at recreating a computer monitor");

size(1000, 1200);
background(365, 365, 365);

line(50, 50, 800, 50);
line(800, 50, 800, 800);
line(800, 800, 50, 800);
line(50, 800, 50, 50);

stroke(0, 0, 0);
for (int y = 50; y <= 800; y++) {
  line(50, y, 800, y);
}

line(100, 100, 750, 100);
line(750, 100, 750, 750);
line(750, 750, 100, 750);
line(100, 750, 100, 100);


stroke(0, 173, 239);
for (int y = 100; y <= 750; y++) {
  line(100, y, 750, y);
}

stroke(0, 0, 0);
for (int x = 150; x < 725; x += 100) {
  for (int y = 150; y < 725; y += 100) {
    line(x, y, x + 50, y);
    line(x + 50, y, x + 50, y + 50);
    line(x + 50, y + 50, x, y + 50);
    line(x, y + 50, x, y);
    
    stroke(random.nextInt(366),random.nextInt(366),random.nextInt(366));
    for (int fillY = y; fillY <= y + 50; fillY++) {
      line(x,fillY,x + 50,fillY);
    }
        
  }
}

stroke(0,0,0);

line(350, 800, 350, 1000);
line(500, 800, 500, 1000);

for (int y = 800; y <= 1000; y++) {
  line(350, y, 500, y);
}

 fill(365,365,365);
 circle(425, 900, 100);


stroke(128,128,128);

line(300, 1000, 300, 1100);
line(550, 1000, 550, 1100);

line(300, 1100, 550, 1100);

line(300, 1000, 350, 1000);
line(500, 1000, 550, 1000);

for (int y = 1000; y <= 1100; y++) {
  line(300, y, 550, y);
}
