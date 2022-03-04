color[] colors = {
  color(0),
  color(255),
  color(200),
  color(0,0,255)
};

class Tile {
  boolean isEnd;
  // 0 means solid block, 1 means space that has not been traversed, 2 means traversed, 3 means currently traversed
  int state;
  // x and y coordinates inside the 
  int x,y;
  int w,h;
  
  Tile(int x, int y, int w, int h, boolean isEnd, int state) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.isEnd = isEnd;
    this.state = state;
  }
  
  void display() {
    if (isEnd) {
      fill(255,0,0);
    } else {
      fill(colors[state]);
    }
    rect(x,y,w,h);
  }
}

int starti;
int startj;

void setup() {
  size(800, 800);
  String in = "Data/hard-dw.txt";
  Tile[][] maze = init(in);
  displayAll(maze);
  println(DepthFirstSearch(starti,startj,maze));
  displayAll(maze);
}

Tile[][] init(String file) {
  String[] load = loadStrings(file);
  Tile[][] maze = new Tile[load.length][load[0].length()];
  //output.println(maze.length + " " + maze[0].length);
  int w = width / maze[0].length;
  int h = height / maze.length;
  for (int i = 0; i < load.length; i++) {
    String str = load[i];
    for (int j = 0; j < str.length(); j++) {
      int state;
      int x = w * j;
      int y = h * i;
      boolean isEnd = false;
      if (str.charAt(j) == '#') {
        state = 0;
      } else if (str.charAt(j) == '$') {
        state = -1;
        isEnd = true;
      } else {
        state = 1;
      }
      maze[i][j] = new Tile(x, y, w, h, isEnd, state);
      //output.println(x + " " + y + " " + w + " " + h + " " + isEnd + " " + state);
      if (str.charAt(j) == '?') {
        starti = i;
        startj = j;
      }
    }
  }
  return maze;
}

boolean DepthFirstSearch(int i, int j, Tile[][] maze) {
  if (maze[i][j].isEnd) {
    return true;
  }
  maze[i][j].state = 3;
  //Write(i,j,3);
  for (int addi = -1; addi <= 1; addi++) {
    for (int addj = -1; addj <= 1; addj++) {
      i += addi;
      j += addj;
      if (abs(addi) == abs(addj) || i < 0 || i >= maze.length || j < 0 || j >= maze[0].length) {
        i -= addi;
        j -= addj;
        continue;
      }
      // if its not been traversed, then go through it
      if (maze[i][j].state == 1 || maze[i][j].isEnd) {
        if (DepthFirstSearch(i,j,maze)) {
          return true;
        }
      }
      i -= addi;
      j -= addj;
    }
  }
  maze[i][j].state = 2;
  //Write(i,j,2);
  return false;
} //<>//
