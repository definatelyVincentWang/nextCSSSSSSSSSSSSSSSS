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
  py = 560;
  psize = 40;
}

void draw() {
  fill(255);
  background(0);
  circle(px,py,psize * 2);
  px += pxvel;
  py += pyvel;
  
  for (Target i : targets) {
    i.display();
  }
  for (int i = 0; i < bulletNum; i++) {
    bullets[i].display();
  }
  /*
  for (int i = 0; i < bulletNum; i++) {
    if (bullets[i].y < 0) {
      
    }
  }
  */
  
  for (Target i : targets) {
    for (int b = 0; b < bulletNum; b++) {
      if (touching(i.x, i.y, i.size, bullets[b].bx, bullets[b].by, bullets[b].bsize)) {
        i.state = 1;
        i.c = color(255, 0, 0);
        i.startedExploding = millis();
      }
    }
  }
  if (px <= psize || px >= (width-psize)) {
      pxvel = 0;
  }
  if (py <= psize || py >= (height-psize)) {
    pyvel = 0;
  }
}

void keyPressed() {
  if (key == ' ') {
    bullets[bulletNum] = new Bullet(px, py);
    bulletNum++;
  }
  if (key == 'w' && pyvel > -3) {
    pyvel -= 1;
  }
  if (key == 's' && pyvel < 3) {
    pyvel += 1;
  }
  if (key == 'a' && pxvel > -3) {
    pxvel -= 1;
  }
  if (key == 'd' && pyvel < 3) {
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
    c = color(0,255,0);
  }
  public void display() {
    fill(c);
    if (state == 0) {
      circle(x, y, size*2);
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
