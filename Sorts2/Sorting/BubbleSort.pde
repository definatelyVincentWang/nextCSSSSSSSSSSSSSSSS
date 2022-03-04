int BubbleSort(int[] array) {
  int ncomps = 0;
  for (int i = array.length - 1; i >= 0; i--) {
    boolean swapped = false;
    for (int from = 0; from < i; from++) {
      int to = from + 1;
      if (array[from] > array[to]) {
        int temp = array[from];
        array[from] = array[to];
        array[to] = temp;
        swapped = true;
        WriteSwap(from,to,true);
      } else {
        WriteSwap(from,to,false);
      }
      ncomps++;
    }
    if (!swapped) {
      return ncomps;
    }
  }
  return ncomps;
}
