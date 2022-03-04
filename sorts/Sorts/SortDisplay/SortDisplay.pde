// SortDisplay
boolean HaveData = false;
String Filename = "";
Display D;

int[] Data;
int[] DataBackup;
Swap[] Swaps;
int NumSwaps;
int SwapIndex = 0;
boolean Going = false;

color CFrom = color(100,255,100);
color CTo = color(255,100,100);
color CNormal = color(255);

int SwapState0 = 0;
int SwapState1 = 1;  // just colored
int SwapState2 = 2;  // swapped
int SwapState3 = 3;  // back to normal
int SwapState = SwapState0;

void setup() {
  size(700,500);
  //brcShowMessages(true);
}

void draw() {
  brc();
  
  String name = brcChanged();
  if (name.equals("Filename")) Filename = brcValue(name);
  
  if (name.equals("ReadFile")) {
    if (Filename == "")
      println("No filename!");
    else {
      String result = GetData(Filename);
      if (result.length() > 0)
        println(result);
    }
    D = new Display(Data);
    D.displayAll();
    HaveData = true;
    SwapState = SwapState0;
  }
  
  if (name.equals("frame-rate"))
    frameRate(int(brcValue(name)));
    
  if (name.equals("Restart")) {
    Going = false;
    SwapIndex = 0;
    for(int i = 0; i < Data.length; ++i)
      Data[i] = DataBackup[i];
    D.displayAll();
  }
  
  if (SwapState != SwapState0)   // are we swapping?
    Go_once();
    
  if (name.equals("Go-once"))
    Go_once();
    
  if (name.equals("Restart")) {
    if (HaveData) SwapIndex = 0;
  }
  
  
  if (name.equals("Go-start"))
    Going = true;
  if (name.equals("Go-stop"))
    Going = false;
    
  if (Going)
    Go_once();
    
}

void Go_once() {
  if (!HaveData) return;
  if (SwapIndex >= NumSwaps) {
    Going = false;
    return;
  }
  if (SwapState == SwapState0) {
    if (!Swaps[SwapIndex].swap) {
      D.displayOne(Swaps[SwapIndex].from,CFrom);
      D.displayOne(Swaps[SwapIndex].to,CFrom);
      SwapState = SwapState2;
      return;
    }
    D.displayOne(Swaps[SwapIndex].from,CFrom);
    D.displayOne(Swaps[SwapIndex].to,CTo);
    SwapState = SwapState1;
    return;
  }
  if (SwapState == SwapState1) {
    int temp = Data[Swaps[SwapIndex].to];
    Data[Swaps[SwapIndex].to] = Data[Swaps[SwapIndex].from];
    Data[Swaps[SwapIndex].from] = temp;
    D.displayOne(Swaps[SwapIndex].to,CFrom);
    D.displayOne(Swaps[SwapIndex].from,CTo);
    SwapState = SwapState2;
    return;
  }
  if (SwapState == SwapState2) {
    D.displayOne(Swaps[SwapIndex].from,CNormal);
    D.displayOne(Swaps[SwapIndex].to,CNormal);
    SwapState = SwapState0;
    SwapIndex++;
  }
  
}
String GetData(String filename) {
  int i, n = 0;
  int in_from, in_to;
  boolean in_swap;
  
  String[] lines = loadStrings(filename);
  if (lines == null)
    return "Filename not readable: "+filename;
  
  String[] sdata = split(lines[0]," ");
  if (sdata[0].equals("Elements")) {
    Data = new int[sdata.length-1];
    DataBackup = new int[sdata.length-1];
    for (i = 1; i < sdata.length; ++i) {
      Data[i-1] = int(sdata[i]);
      DataBackup[i-1] = Data[i-1];
    }
    println("Data.length",Data.length);
  }
  else 
    return "Bad data, first line should be Elements";
  
  Swaps = new Swap[lines.length-1];
  
  for (i = 1; i < lines.length; ++i) {
    String[] parts = split(lines[i], " ");
    if (parts.length == 4 && parts[0].equals("swap")) {
      in_from = int(parts[1]);
      in_to = int(parts[2]);
      in_swap = parts[3].equals("true");
      Swaps[n] = new Swap(in_from,in_to,in_swap);
      ++n;
    }
  }
  
  NumSwaps = n;
  
  println("Data: ",Data.length);
  println("NumSwaps: ",NumSwaps);
  return "";
}
  
class Swap {
  int from;
  int to;
  boolean swap;
  
  Swap(int in_from, int in_to, boolean in_swap) {
    from = in_from;
    to = in_to;
    swap = in_swap;
  }
}
