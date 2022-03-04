boolean firstClick = true;
boolean fixCrop = false;
int[] oldPixels = new int[100];


void Crop() {
  background(200);
  pixels = oldPixels;
  if (Crop) {
    if (mousePressed) {
      if (firstClick) {
        prevRectX = mouseX;
        prevRectY = mouseY;
        newRectX = prevRectX;
        newRectY = prevRectY;
        firstClick = false;
      }
      if (frameCount == prevFrame + 1) {
        fill(0, 0, 0, 100);
        rect(prevRectX, prevRectY, newRectX - prevRectX, newRectY - prevRectY);
      }
      newRectX = mouseX;
      newRectY = mouseY;
      prevFrame = frameCount;
    }
    if (brcChanged().equals("EndCrop")) {
      if (prevRectX > newRectX) {
        int temp = prevRectX;
        prevRectX = newRectX;
        newRectX = temp;
      }
      if (prevRectY > newRectY) {
        int temp = prevRectY;
        prevRectY = newRectY;
        newRectY = temp;
      }
      fill(0, 0, 0, 100);
      rect(prevRectX, prevRectY, newRectX - prevRectX, newRectY - prevRectY);
      fixCrop = true;
      Crop = false;
    }
  }
  if (fixCrop) {
    if (mousePressed) {
      if (mouseX > prevRectX - 20 && mouseX < prevRectX) {
        prevRectX = mouseX;
      }
      if (mouseX > newRectX && mouseX < newRectX + 10) {
        newRectX = mouseX;
      }
      if (mouseY > prevRectY - 20 && mouseY < prevRectY) {
        prevRectY = mouseY;
      }
      if (mouseY > newRectY && mouseY < newRectY + 10) {
        newRectY = mouseY;
      } 
      if (mouseX > prevRectX && mouseX < newRectX && mouseY > prevRectY && mouseY < newRectY) {
        if (frameCount == prevFrame + 1) {
          prevRectX += mouseX - prevX;
          newRectX += mouseX - prevX;
          prevRectY += mouseY - prevY;
          prevRectY += mouseY - prevY;
        }
        prevX = mouseX;
        prevY = mouseY;
        prevFrame = frameCount;
      }

      if (frameCount == prevFrame + 1) {
        fill(150, 200);
        rect(prevRectX, prevRectY, newRectX - prevRectX, newRectY - prevRectY);
      }
      prevFrame = frameCount;
    }
  }
  if (brcChanged().equals("EndCrop")) {
    fixCrop = false;
    Crop = false;
    arrayCopy(oldPixels, pixels);
    for (int i = 0; i < pixels.length; i++) {
      int x = i % width;
      int y = i / width;
      if (x > prevRectX && x < newRectX && y > prevRectY && y < newRectY) {
        continue;
      }
      pixels[i] = color(200);
    }
  }
}
