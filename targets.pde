size(500,400);

color red = color(255, 0, 50);
color white = color(255, 255, 255);

int x = 100, y = 150;

int r1 = 150;
int r2 = 100;
int r3 = 50;

fill(red);
circle(x,y,r1);
fill(white);
circle(x,y,r2);
fill(red);
circle(x,y,r3);

x += 150;
y += 150;

fill(red);
circle(x,y,r1);
fill(white);
circle(x,y,r2);
fill(red);
circle(x,y,r3);

x += 150;
y -= 150;

fill(red);
circle(x,y,r1);
fill(white);
circle(x,y,r2);
fill(red);
circle(x,y,r3);
