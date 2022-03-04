float xvel = 1;
float yvel = -2;
float x, y;
color c = color(255,180,0);
float radius = 50;  
boolean running;

void setup() {
  size(600,600);
  x = random(width-2*radius) + radius;
  y = random(height-2*radius) + radius;
  running = false;
}

void draw() {
  
  brc();  // Check for incoming messages from the browser window
  
  String name = brcChanged();  // Name of any control that has sent a message
  
  if (name.equals("start")) running = true;
  
  if (name.equals("stop")) running = false;
  
  if (!running) return;

  if (brcValue("color").equals("WHITE"))
    c = color(255,255,255);
  else if (brcValue("color").equals("RANDOM"))
    c = color(random(255),random(255),random(255));
  else if (brcValue("color").equals("RED"))
    c = color(255,0,0);
  else
    c = color(0,255,0);
  
  if (name.equals("xvel")) {
    xvel = int(brcValue("xvel"));
  }
  
  if (name.equals("yvel")) {
    yvel = int(brcValue("yvel"));
  }
  
  background(120);
  x += xvel;
  if (x + radius > width || x < radius) {
    x -= xvel;
    xvel = -xvel;
  }
  y += yvel;
  if (y + radius > height || y < radius) {
    y -= yvel;
    yvel = -yvel;
  }
  fill(c);
  circle(x,y,2*radius);
}
