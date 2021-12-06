int InsertionSort(int[] data) {
  int ncomps = 0;
  for (int compare = 1; compare < data.length; compare++) {
    int val = data[compare];
    int swap = compare - 1;
    for (; swap >= 0; swap--) {
      if (val < data[swap]) {
        data[swap] = data[swap + 1];
        WriteSwap(swap, swap+1, true);
      } else {
        WriteSwap(swap, swap+1, false);
      }
    }
    ncomps++;
    data[swap+1] = val;
  }
  return ncomps;
}
