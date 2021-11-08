// ============================================= Exploding Targets ===================================

int ntargets = 15;
Target[] targets = new Target[ntargets];
int TargetRadius = 20;
float ExplodingTime = 3;  // number of seconds of darkening rec color, then DEAD
int BallRadius = 15;
int MaxVel = 3;  // maximum velocity in + or - in x or y direction

// the target's states:
int ALIVE = 0;
int EXPLODING = 1;
int DEAD = 2;

// Player's ball parameters
int bx,by,bxvel,byvel;

void setup() {
   size(600,600);
   background(0);
   for(int i = 0; i < ntargets; ++i) {
     targets[i] = new Target();
     boolean intersect = true;
     while (intersect) {
       intersect = false;
       for (int j = i - 1; j >= 0; j--) {
         if (dist(targets[j].cx, targets[j].cy, targets[i].cx, targets[i].cy) < TargetRadius * 2) {
           intersect = true;
         }
       }
       if (intersect) {
         targets[i].cx = int(random(TargetRadius, width-TargetRadius));
         targets[i].cy = int(random(TargetRadius, height-TargetRadius));
       }
     }
   }
   bx = width/2;
   by = height/2;
   bxvel = 0;
   byvel = 0;
   stroke(255);  // white border around targets
}

void draw() {
  boolean flag = true;
  for (Target i : targets) {
    if (i.state != DEAD) {
      flag = false;
    }
  }
  if (flag) {
    setup();
  }
  background(0);
  stroke(255);
  for (int i = 0; i < ntargets; ++i) {
    targets[i].display();
  }
  
  fill(255);
  circle(bx,by,2*BallRadius);
  stroke(0);
  line(bx-BallRadius,by,bx+BallRadius,by);
  line(bx,by-BallRadius,bx,by+BallRadius);
  
  bx += bxvel;
  by += byvel;
  if (bx < BallRadius) {
    bx = BallRadius;
    bxvel = 0;
  }
  if (bx > width - BallRadius) {
    bx = width - BallRadius;
    bxvel = 0;
  }
  if (by < BallRadius) {
    by = BallRadius;
    byvel = 0;
  }
  if (by > height - BallRadius) {
    by = height - BallRadius;
    byvel = 0;
  }
}

    
class Target {
  int cx, cy;
  int startedExploding;  // in milliseconds (use millis())
  int state;
  color c;
  
  
  Target() {
    cx = int(random(TargetRadius, width-TargetRadius));
    cy = int(random(TargetRadius, height-TargetRadius));
    state = ALIVE;
    c = color(random(100,255),random(100,255),random(100,255));
  }
  
  void display() {
    if (state == ALIVE) {
      if (dist(cx,cy,bx,by) < (TargetRadius+BallRadius)) {
        state = EXPLODING;
        startedExploding = millis();
        c = color(255,0,0);
      }
      fill(c);
      circle(cx,cy,2*TargetRadius);
    }
    else if (state == EXPLODING) {
      float timeleft = ExplodingTime*1000 - (millis() - startedExploding);
      if (timeleft <= 0) {
        state = DEAD;
      }
      else {
        float factor = timeleft/(ExplodingTime*1000);
        color shade = color(red(c)*factor,green(c)*factor,blue(c)*factor);
        fill(shade);
        circle(cx,cy,2*TargetRadius);
      }
    }
  }
}

/* ===================
 keyPressed:
 Change the speeds of the player ball with keystrokes as follows
 But make sure that MaxVel is not exceeded in any direction
   'w' : y speed - 1
   'a' : x speed - 1
   's' : y speed + 1
   'd' : x speed + 1
 =================== */

void keyPressed() {
  if (key == 'w') {
    byvel -= 1;
    if (byvel < -MaxVel) byvel = -MaxVel;
  }
  else if (key == 's') {
    byvel += 1;
    if (byvel > MaxVel) byvel = MaxVel;
  }
  else if (key == 'a') {
    bxvel -= 1;
    if (bxvel < -MaxVel) bxvel = -MaxVel;
  }
  else if (key == 'd') {
    bxvel += 1;
    if (bxvel > MaxVel) bxvel = MaxVel;
  }
}

