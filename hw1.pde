size(1000, 1000);
background(135,206,235);
fill(356, 308, 40);

noStroke();
circle(925, 75, 100);
noFill();
stroke(0,0,0);

stroke(255, 224, 218);

// head
fill(255, 224, 218);
circle(500, 225, 150);

// eyes
stroke(0,0,0);
ellipse(450, 200, 20, 10);
ellipse(550, 200, 20 , 10);

// mouth
stroke(365, 0, 0);
ellipse(500, 265, 40, 5);

stroke(0,0,0);

// body
line(400, 300, 600, 300);

line(400, 300, 400, 700);
line(600, 300, 600, 700);

line(400, 700, 600, 700);

stroke(365, 365, 365);
for(int y = 300; y <= 700; y++) {
  line(400, y, 600, y);
}

// words

stroke(0,0,0);

// arms
strokeWeight(30);
line(400, 405, 200, 330);
line(600, 405, 800, 330);

strokeWeight(1);

// legs
line(400, 700, 400, 950);
line(500, 700, 500, 950);
line(600, 700, 600, 950);

line(400, 850, 600, 950);
for(int y = 700; y <= 950; y++) {
  line(400, y, 500, y);
}
stroke(0,0, 128);
for(int y = 700; y <= 950; y++) {
  line(500, y, 600, y);
}
/*
// feet
line(410, 850, 360, 875);
line(490, 850, 440, 875);
line(360, 875, 440, 875);

line(510, 850, 460, 875);
line(590, 850, 540, 875);
line(460, 875, 540, 875);

line(400, 850, 410, 850);
line(490, 850, 500, 850);

line(500, 850, 510, 850);
line(590, 850, 600, 850);
*/

// grass
stroke(0,154,23);
strokeWeight(100);
line(0, 1000, 1000, 1000);
