// Create a board with pink and brown tiles...

size(800,400);

int Nx;    // number of Blocks horizontally (odd number in [11 ... 61]
int Ny;    // number of Blocks vertically = Nx/2

// Choose the number of blocks  Nx: odd number in the range [11 ... 61]
Nx = 21 + 2 * int(random(26));
Ny = Nx/2;

float BlockWidth = width / Nx;  

class Block {
  float xpos;  // top-left
  float ypos;  // top-left
  float bwidth;
  boolean isPink;
  
  Block(float x, float y, float blockwidth) {
    xpos = x;
    ypos = y;
    bwidth = blockwidth;
    isPink = true;  // by default
  }
  
  void display() {
    // ========================== Your illuminating code here...=============
    color c = color(161,61,45);
    if (isPink) {
      c = color(241,145,155);
    }
    fill(c);
    square(xpos,ypos,bwidth);
  }
}


Block[][] blocks = new Block[Ny][Nx];
/* Note: by convention the first index is which row, and the second
    index is which column. So...
    blocks[3][1] is the Block in the 4th row from the top, second column
*/


int irow, icol;

// Create the blocks
for (irow = 0; irow < Ny; ++irow) {
  for (icol = 0; icol < Nx; ++icol) {
    blocks[irow][icol] = new Block(icol*BlockWidth,irow*BlockWidth, BlockWidth);
  }
}
// ========================== Awaiting thine spotless code ... ==================
// Now go through appropriate members of the blocks to color them brownish'
int pink = Ny;
boolean goUp = false;

for (icol = 0; icol < Nx; ++icol) {
  for (irow = pink + 1; irow < Ny; ++irow) {
    blocks[irow][icol].isPink = false;
  }
  if (goUp)
    pink++;
  else
    pink--;
    
  if (pink == 0) {
    goUp = true;
  }
}
// And now, go though all the blocks and politely ask each to display itself.
for (irow = 0; irow < Ny; ++irow) {
  for (icol = 0; icol < Nx; ++icol) {
    blocks[irow][icol].display();
  }
}
