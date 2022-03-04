void setup() {
  int[] array = new int[10];
  for (int i = 0; i < array.length; i++) {
    array[i] = (int)random(10);
  }
  for (int i : array) {
    print(i + " ");
  }
  InsertionSort(array);
  println();
  for (int i : array) {
    print(i + " ");
  }
}

int InsertionSort(int[] array) {
  int ncomps = 0;
  for (int compare = 1; compare < array.length; compare++) {
    int val = array[compare];
    int swap = compare - 1;
    while (swap >= 0 && array[swap] > val) {
      array[swap + 1] = array[swap];
      println("Swapping " + swap + " with " + int(swap+1));
      //WriteSwap(swap, swap+1, true);
      swap--;
    }
    //WriteSwap(swap, swap+1, false);
    ncomps++;
    array[swap+1] = val;
  }
  return ncomps;
}
