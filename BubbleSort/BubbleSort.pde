PrintWriter out;
int arraySize = 10;

void setup() {
  out = createWriter("output.txt");
  int[] array = new int[arraySize];
  for (int i = 0; i < arraySize; i++) {
    array[i] = (int)random(50);
  }
  out.print("Elements:");
  for (int i : array) {
    out.print(" " + i);
  }
  out.println();
  BubbleSort(array);
  out.print("Result:");
  for (int i : array) {
    out.print(" " + i);
  }
  out.flush();
  out.close();
}

void BubbleSort(int[] array) {
  for (int i = array.length - 1; i >= 0; i--) {
    boolean swapped = false;
    for (int from = 0; from < i; from++) {
      int to = from + 1;
      out.print("swap " + from + " " + to);
      if (array[from] > array[to]) {
        out.print(" true");
        int temp = array[from];
        array[from] = array[to];
        array[to] = temp;
        swapped = true;
      } else {
        out.print(" false");
      }
      out.println();
    }
    if (!swapped) {
      return;
    }
  }
}

/*
turns out this was a different kind of sort
void BubbleSort(int[] array) {
  for (int largest = array.length - 1; largest >= 0; largest--) {
    boolean noSwaps = true;
    for (int compare = 0; compare < largest; compare++) {
      out.print("swap " + largest + " " + compare);
      if (array[compare] > array[largest]) {
        out.print(" true");
        int temp = array[compare];
        array[compare] = array[largest];
        array[largest] = temp;
        noSwaps = false;
      } else {
        out.print(" false");
      }
      out.println();
    }
  }
}
*/
