int px, py, psize;

void setup() {
  
}

class Bullet {
  int bx, by, bsize;
  
}

class Target {
  int x,y,size;
  int state;
  int velx, vely;
  int c;
  int startedExploding;
  
  public Target(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    state = 0;
    velx = 1;
    vely = 1;
    c = color(255,255,255);
  }
  public void display() {
    if (state == 0) {
      circle(x,y,size);
      x += velx;
      y += vely;
      velx = -velx;
      vely = -vely;
      if (touching(bx, by, bsize)) {
        state = 1;
        c = color(255,0,0);
        startedExploding = millis();
      }
    } else if (state == 1) {
      fill(c);
      circle(x,y,size * 2);
      float newMillis = (millis() - startedExploding) * 255 / 3000;
      if (newMillis >= 255) {
        noStroke();
        circle(x,y,size * 2);
        state = 2;
      }
      c = color(255,0,0,255 - newMillis);
    }
  }
  public boolean touching(int bx, int by, int bsize) {
    return dist(x,y,bx,by) < size + bsize;
  }
}
