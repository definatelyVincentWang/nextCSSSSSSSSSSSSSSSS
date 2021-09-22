import java.util.Random;
Random random = new Random();

size(600, 600);
// one number = grayscale, 3 numbers = rgb
stroke(200, 50, 200);
// pixel size of each stroke
strokeWeight(10);
line(0,0,700,500);

strokeWeight(1);
stroke(0,0,365);

fill(0,255,0);
circle(300,300,100);


int radius = 15;
int diameter = radius * 2;

for(int x = radius; x <= 600 - radius; x += diameter) {
  for (int y = 15; y <= 600 - radius; y += diameter) {
    fill(random.nextInt(255), random.nextInt(255), random.nextInt(255));
    circle(x,y,diameter);
  }
}


int A = 5;
println(A);
A = 10;
println(A);
//A = 5.5;
println(A);
