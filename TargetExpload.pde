int px, py, psize;
int pxvel, pyvel;
Target[] targets = new Target[20];
Bullet[] bullets = new Bullet[100];
int bulletNum = 0;

void setup() {
  for (int i = 0; i < targets.length; i++) {
    targets[i] = new Target((int)random(600), (int)random(200), (int)random(1,30));
  }
  background(0);
  size(600,600);
  px = 400;
  py = 600;
  psize = 40;
}

void draw() {
  fill(255);
  background(0);
  circle(px,py,psize);
  px += pxvel;
  py += pyvel;
  for (Target i : targets) {
    for (int b = 0; b < bulletNum; b++) {
      if (touching(i.x, i.y, i.size, bullets[b].bx, bullets[b].by, bullets[b].bsize)) {
        i.state = 1;
        i.c = color(255, 0, 0);
        i.startedExploding = millis();
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    bullets[bulletNum] = new Bullet(px, py);
    bulletNum++;
  }
  if (key == 'w') {
    pyvel -= 1;
  }
  if (key == 's') {
    pyvel += 1;
  }
  if (key == 'a') {
    pxvel -= 1;
  }
  if (key == 'd') {
    pxvel += 1;
  }
}

public boolean touching(int x, int y, int size, int bx, int by, int bsize) {
  return dist(x, y, bx, by) < size + bsize;
}

class Bullet {
  int bx, by, bsize;

  public Bullet(int x, int y) {
    bx = x;
    by = y;
    bsize = 10;
  }
  public void display() {
    fill(0,0,255);
    circle(bx,by,bsize);
    by -= 10;
  }
}

class Target {
  int x, y, size;
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
    c = color(255, 255, 255);
  }
  public void display() {
    fill(255,0,0);
    if (state == 0) {
      circle(x, y, size);
      x += velx;
      y += vely;
      velx = -velx;
      vely = -vely;
    } else if (state == 1) {
      fill(c);
      circle(x, y, size * 2);
      float newMillis = (millis() - startedExploding) * 255 / 3000;
      if (newMillis >= 255) {
        noStroke();
        circle(x, y, size * 2);
        state = 2;
      }
      c = color(255, 0, 0, 255 - newMillis);
    }
  }
}
