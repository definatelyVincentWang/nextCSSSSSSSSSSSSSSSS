class Tile {
  float x, y;
  float w;
  int bombs;
  float state;

  public Tile(float x, float y, float w, int bombs) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.state = 0;
    this.bombs = bombs;
  }

  public void flagged() {
    if (state == 1) {
      state = 0;
    } else {
      state = 1;
    }
  }
  public void displayed() {
    state = 2;
  }

  public void clicked(boolean flagging, int posX, int posY) {
    boolean meetingX = mouseX > x && mouseX < x + w;
    boolean meetingY = mouseY > y && mouseY < y + w;
    if (mousePressed && meetingX && meetingY) {
      if (mouseButton == RIGHT && tiles[posX][posY].state != 2) {
        flagged();
      } else if (tiles[posX][posY].state != 1) {
        if (firstClick) {
          firstClick = false;
          // create a template for the numbers in the tiles
          int[][] states = new int[totTiles][totTiles];
          for (int numBomb = 0; numBomb < totBombs; numBomb++) {
            int x = (int)random(states.length);
            int y = (int)random(states.length);
            while (x == posX) {
              x = (int)random(states.length);
            }
            while (y == posY) {
              y = (int)random(states.length);
            }
            states[x][y] = -1;
          }
          for (int stateX = 0; stateX < states.length; stateX++) {
            for (int stateY = 0; stateY < states[0].length; stateY++) {
              if (states[stateX][stateY] == -1) {
                continue;
              }
              states[stateX][stateY] = checkBombs(stateX, stateY, states);
            }
          }
          for (int x = 0; x < tiles.length; x++) {
            for (int y = 0; y < tiles[0].length; y++) {
              tiles[x][y].bombs = states[x][y];
            }
          }
        }
        displayed();
        boolean[][] seen = new boolean[totTiles][totTiles];
        reveal(posX, posY, seen);
      }
    }
  }

  public void display() {
    fill(255);
    square(x, y, w);
    fill(0);
    float displayX = x + w / 2;
    float displayY = y + 5 * w / 6;
    if (state == 1) {
      text("F", displayX, displayY);
    }
    if (state == 2 && bombs != -1) {
      fill(225);
      square(x, y, w);
      fill(colors[bombs]);
      text(bombs, displayX, displayY);
    }
    if (state == 2 && bombs == -1) {
      fill(255, 0, 0);
      square(x, y, w);
      fill(0);
      text("X", displayX, displayY);
      dead = true;
    }
  }
}

Tile[][] tiles;
color[] colors = new color[]{color(255), color(0, 0, 255), color(0, 255, 0), color(255, 255, 0), color(160, 32, 240), color(255, 0, 0), color(255, 183, 197), color(100), color(200)};
boolean dead = false;
boolean firstClick = true;
int totTiles;
int totBombs;

void setup() {
  size(1000, 1000);

  // outside parameters
  totTiles = 20;
  totBombs = 150;


  // initialize the tiles
  tiles = new Tile[totTiles][totTiles];
  for (int x = 0; x < tiles.length; x++) {
    int posX = (int)x * (width / totTiles);
    for (int y = 0; y < tiles[0].length; y++) {
      int posY = (int)y * (height / totTiles);
      tiles[x][y] = new Tile(posX, posY, width / totTiles, 0);
    }
  }

  // initialize the font
  PFont font = createFont("arial", width / totTiles);
  textFont(font);
  textAlign(CENTER);
}

void draw() {
  /*
  brc();
   String changed = brcChanged();
   if (changed.equals()) {
   
   }
   */

  if (dead) {
    for (int px = 0; px < tiles.length; px++) {
      for (int py = 0; py < tiles.length; py++) {
        tiles[px][py].state = 2;
        tiles[px][py].display();
      }
    }
    return;
  }

  // reset is an outside variable
  boolean reset = false;
  if (reset) {
    setup();
  }

  // flagging is an outside variable
  boolean flagging = false;
  for (int posX = 0; posX < tiles.length; posX++) {
    for (int posY = 0; posY < tiles.length; posY++) {
      tiles[posX][posY].display();
      tiles[posX][posY].clicked(flagging, posX, posY);
    }
  }
}

public void reveal(int posX, int posY, boolean[][] seen) {
  seen[posX][posY] = true;
  if (tiles[posX][posY].bombs == 0) {
    tiles[posX][posY].state = 2;
    if (posX - 1 >= 0 && !seen[posX-1][posY]) {
      reveal(posX-1, posY, seen);
    }
    if (posY - 1 >= 0 && !seen[posX][posY - 1]) {
      reveal(posX, posY-1, seen);
    }
    if (posX + 1 < tiles.length && !seen[posX + 1][posY]) {
      reveal(posX + 1, posY, seen);
    }
    if (posY + 1 < tiles.length && !seen[posX][posY + 1]) {
      reveal(posX, posY + 1, seen);
    }
    if (posX + 1 < tiles.length && posY + 1 < tiles.length && !seen[posX + 1][posY + 1]) {
      reveal(posX + 1, posY + 1, seen);
    }
    if (posX - 1 >= 0 && posY - 1 >= 0 && !seen[posX - 1][posY - 1]) {
      reveal(posX-1, posY-1, seen);
    }
  } else if (tiles[posX][posY].bombs != -1) {
    tiles[posX][posY].state = 2;
  }
}

public int checkBombs(int posX, int posY, int[][] states) {
  int bombs = 0;
  if (posX - 1 >= 0 && states[posX - 1][posY] == -1) {
    bombs++;
  }
  if (posY - 1 >= 0 && states[posX][posY - 1] == -1) {
    bombs++;
  }
  if (posX + 1 < states.length && states[posX + 1][posY] == -1) {
    bombs++;
  }
  if (posY + 1 < states.length && states[posX][posY + 1] == -1) {
    bombs++;
  }
  if (posX + 1 < states.length && posY + 1 < states.length && states[posX + 1][posY + 1] == -1) {
    bombs++;
  }
  if (posX - 1 >= 0 && posY - 1 >= 0 && states[posX - 1][posY - 1] == -1) {
    bombs++;
  }
  if (posX + 1 < states.length && posY - 1 >= 0 && states[posX + 1][posY - 1] == -1) {  
    bombs++;
  }
  if (posX - 1 >= 0 && posY + 1 < states.length && states[posX-1][posY+1] == -1) {
    bombs++;
  }
  return bombs;
}
