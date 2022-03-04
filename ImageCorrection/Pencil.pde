void Pencil() {
  fill(color(R, G, B));
  stroke(color(R, G, B));
  circle(mouseX, mouseY, int(brcValue("Size")));
  if (mousePressed) {
    if (frameCount == prevFrame + 1) {
      line(prevX, prevY, mouseX, mouseY);
    }
    prevX = mouseX;
    prevY = mouseY;
    prevFrame = frameCount;
  }
}
