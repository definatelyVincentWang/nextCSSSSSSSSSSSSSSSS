// Strings in java
String B = "HI";
// can initialize with double quotes and put chars between the double quotes.

char c = 't';
// This datatype holds a single character and uses single quotes to init.

String q = B + c + 'a' + "A";
// can concatenate strings.

println("A=" + 1.23);
// will produce -> A=1.23

println(q.length());
// this will return the length of a string.

B.charAt(1);
// This will return the character at position 1.

// to make an exact copy
String C = "";
for (int i = 0; i < B.length(); ++i) {
  C += B.charAt(i);
}
println(C);

// How to setup a processing file:

/*
// create variables
int i;
String Q;

void setup() {
  // add setup things
  // initialize vairables
  Q = "pizza";
  i = 39;
}

void draw() {
  // add things to draw
  println(Q);
}
*/
