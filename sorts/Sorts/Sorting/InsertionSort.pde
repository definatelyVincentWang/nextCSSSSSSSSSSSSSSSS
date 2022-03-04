int InsertionSort(int[] data) {
  int ncomps = 0;
  for (int compare = 1; compare < data.length; compare++) {
    int val = data[compare];
    int swap = compare - 1;
    while (swap >= 0 && data[swap] > val) {
      data[swap + 1] = data[swap];
      WriteSwap(swap, swap+1, true);
      swap--;
      ncomps++;
    }
    data[swap+1] = val;
    WriteSwap(swap+1,compare, true);
  }
  return ncomps;
}
