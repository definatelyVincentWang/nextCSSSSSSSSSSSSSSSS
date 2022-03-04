int[] badCharacters = {60, 62, 58, 34, 47, 92, 124, 63, 42};
// convert to ascii
PImage image;
String imageName;
ArrayList<int[]> Changes = new ArrayList<int[]>();
int changePos = 0;

boolean madeChanges = false;


//boolean Rotate = false;
boolean Crop = false;
boolean Pencil = false;


String SaveName;
int R;
int G;
int B;
float prevX, prevY;
int prevFrame;
int prevRectX, prevRectY;
int newRectX, newRectY;

void setup() {
  size(1440, 900);
  frameRate(500);
}

void draw() {
  loadPixels();
  brc();
  if (brcChanged().equals("LoadImage")) {
    if (brcValue("ImageType").equals("Link")) {
      imageName = brcValue("ImageLink");
    } else if (brcValue("ImageType").equals("Default")) {
      imageName = brcValue("DefaultImages") + ".jpg";
    }
    image = loadImage(imageName);
    image.resize(width, height);
    image(image, 0, 0);
  }
  String changed = brcChanged();
  if (changed.equals("Crop")) {
    Crop = true;
    madeChanges = true;
    arrayCopy(pixels, oldPixels);
  } else if (changed.equals("Undo")) {
    changePos -= 1;
    if (changePos < 0) {
      println("No changes to Undo");
      changePos += 1;
      return;
    }
    pixels = Changes.get(changePos);
  } else if (changed.equals("Redo")) {
    changePos += 1;
    if (changePos >= Changes.size()) {
      println("No Changes to Redo");
      changePos -= 1;
      return;
    }
    pixels = Changes.get(changePos);
  } else if (changed.equals("Pencil")) {
    Pencil = !Pencil;
  }
  SaveName = brcValue("SaveName");
  R = int(brcValue("Red"));
  G = int(brcValue("Green"));
  B = int(brcValue("Blue"));
  
  if (changed.equals("Save")) {
    if (SaveName.length() == 0 || checkCharacters()) {
      println("Name does not fit unicharacter code");
      return;
    }
    save(SaveName);
  }
  if (madeChanges) {
    if (changePos + 1 < Changes.size()) {
      for (int i = changePos + 1; i < Changes.size(); i++) {
        Changes.remove(i);
      }
    }
    Changes.add(pixels);
    if (Changes.size() > 100) {
      Changes.remove(0);
    }
    madeChanges = false;
  }

  if (Pencil) {
    Pencil();
  } else if (Crop) {
    Crop();
  }
}

boolean checkCharacters() {
  for (int i = 0; i < SaveName.length(); i++) {
    if (contains(SaveName.charAt(i))) {
      return true;
    }
  }
  return false;
}

boolean contains(char c) {
  for (int compare : badCharacters) {
    if ((int)c == compare) {
      return true;
    }
  }
  return false;
}
