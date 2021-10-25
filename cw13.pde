class ball {
  float x,y;
  int radius;
  float Vx, Vy;
  color c;
  
  public ball(int x, int y, int radius) {
   this.x = x;
   this.y = y;
   this.radius = radius;
   this.c = color(0,0,0);
   
   float angle = random(0,360);
   angle = radians(angle);
   Vx = 5 * cos(angle);
   Vy = 5 * sin(angle);
 }
 public void create() {
   circle(x,y,radius * 2);
 }
 public void update() {
   x += Vx;
   y += Vy;
   
   if (outX()) {
     Vx = -Vx;
   }
   if (outY()) {
     Vy = -Vy;
   }
 }
 private boolean outX() {
   return (x + radius > 400) || (x - radius < 0);
 }
 private boolean outY() {
   return (y + radius > 400) || (y - radius < 0);
 }
 private boolean touching(ball b) {
   boolean touchX = (x - radius > b.x) && (x + radius < b.x);
   boolean touchY = (y - radius > b.y) && (y + radius < b.y);
   return touchX && touchY;
 }
 /*
 public void onTouch(ball b) {
   if (touching(b)) {
        Vx = -Vx;
        Vy = -Vy;
        b.Vx = -b.Vx;
        b.Vy = -b.Vy;
        c = color(random(255),random(255),random(255));
        fill(c);
   }
 }
 */
}

ball[] ar = new ball[20];

void setup() {
  size(400,400);
  for (int a = 0; a < ar.length; a++) {
    ar[a] = new ball(200,200,30);
  }
}

void draw() {
  background(200);
  for (ball a : ar) {
    a.create();
    a.update();
    /*
    for (ball b : ar) {
      a.onTouch(b);  
    }
    */
  }
}
