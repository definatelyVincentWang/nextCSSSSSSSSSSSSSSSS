import java.lang.Math;

void setup() {
  size(400,400);
  //println(D2R(100));
  float x = 200;
  float y = 200;
  circle(x,y,100);
  x = findXCoordinate(30, 100, x);
  y = findYCoordinate(30, 100, y);
  line(x,y,30,50);
}

// functions!!!
float D2R(int degrees) {
  return degrees / 180 * (float)Math.PI;
}


float findXCoordinate(int angle, int radius, float x) {
  float radians = D2R(angle);
  float addX = (float)Math.cos(radians) * radius;
  x += addX;
  return x;
}

float findYCoordinate(int angle, int radius, float y) {
    float radians = D2R(angle);
    float addY = (float)Math.sin(radians) * radius;
    y += addY;
    return y;
}

/*

// if statements!!!
// checks if x is equal to 10
int x = 10;
if (x == 10) {
  println("Pizaa!!!!!");
}
// only if 1 statement inside the body
if (x == 10)
  println("PIZAAAAAAA");
// can also do this
if (x == 10) println("PIZAAAAAAA");

// if else
x = 69;
if (x == 10) {
  println("PIZZAAAAA");
} else {
  println("no pizza :(");
}

// if, else if, else
x = 20;
if (x == 10) {
  println("PIZZAAAAA");
} else if (x == 20) {
  println("MEGA PIZZZZZZAAAA");
} else {
  println("no pizza :(");
}

// booleans!!!
boolean Q = true;
if (Q) {
  println("PIZZAAAA");
}

// = assigns a value to a variable
// == compares two values

// one line if else statement
int pizza = 69;
println(pizza > 70 ? "yes" : "no");

*/
