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
   for(int i = 0; i < ntargets; ++i)
     targets[i] = new Target();
   bx = width/2;
   by = height/2;
   bxvel = 0;
   byvel = 0;
   stroke(255);  // white border around targets
}

void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i < ntargets; ++i) {
    targets[i].display();
  }

  // move the player's ball
  bx += bxvel;
  by += byvel;
  fill(255,255,255);
  circle(bx,by,BallRadius * 2);
  stroke(0);
  line(bx - BallRadius, by, bx + BallRadius, by);
  line(bx, by - BallRadius, bx, by + BallRadius);
  if (bx <= BallRadius || bx >= (width-BallRadius)) {
      bxvel = 0;
  }
  if (by <= BallRadius || by >= (height-BallRadius)) {
    byvel = 0;
  }
  if (gameFinished()) {
    setup();
  }
  
  
}

boolean gameFinished() {
  for (Target i : targets) {
    if (i.state != 2) {
      return false;
    }
  }
  return true;
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
  if (key == 'w' && byvel > -3) {
    byvel -= 1;
  }
  if (key == 's' && byvel < 3) {
    byvel += 1;
  }
  if (key == 'a' && bxvel > -3) {
    bxvel -= 1;
  }
  if (key == 'd' && bxvel < 3) {
    bxvel += 1;
  }
  if (keyCode == ENTER) {
    setup();
  }
}


class Target {
  int cx, cy;
  int startedExploding;  // in milliseconds (use millis())
  int state;
  color c;
  
  Target() {
    cx = (int)random(width);
    cy = (int)random(height);
    c = color(random(255),random(255),random(255));
    state = 0;
  }
  
  void display() {
    fill(c);
    if (state == 0) {
      stroke(255,255,255);
      circle(cx,cy,TargetRadius * 2);
      if (touching()) {
        startedExploding = millis();
        state = 1;
        c = color(255,0,0);
      }
    } else if (state == 1) {
      fill(c);
      circle(cx,cy,TargetRadius * 2);
      float newMillis = (millis() - startedExploding) * 255 / 3000;
      if (newMillis >= 255) {
        noStroke();
        circle(cx,cy,TargetRadius * 2);
        state = 2;
      }
      c = color(255,0,0,255 - newMillis);
    }
    return;
  }
  boolean touching() {
    if (dist(cx,cy,bx,by) < BallRadius + TargetRadius) {
      return true;
    }
    return false;
  }
}
