/*

// declaration
int i;

// initialization
i = 69696969;

// both
int q = 96969;

// declare two variables
int l, s;

// delcare and init multiple variables
int a = 50, b, c = 100;
*/

size(500, 400);

int x = 100, y = 150;

// color is a datatype and also the name of a function that makes a color.

// ways to call function:
//   color(int grayscale); 0 - 255
//   color(int r, int g, int b); 0 - 255
//   color(int r, int g, int b, int transparency); 0-255 for first 3, transparency = 0, then color doesnt show up   
//                                                                    transparency = 255, color overrides everything
color c;
c = color(50, 200, 50);
fill(c);

rect(x,y,75,100);

x = x + 50;
y = y - 100;

c = color(255, 255, 20);
fill(c);
rect(x,y,99, 99);
