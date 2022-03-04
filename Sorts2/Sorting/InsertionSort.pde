int InsertionSort(int[] data) {
  int ncomps = 0;
  for (int compare = 1; compare < data.length; compare++) {
    int val = data[compare];
    int swap = compare - 1;
    if (data[swap] > val) {
      WriteMove(compare, data.length + 1);
      for (; swap >= 0; swap--) {
        if (data[swap] <= val) {
          break;
        }
        data[swap + 1] = data[swap];
        WriteMove(swap, swap+1);
        ncomps++;
      }
      data[swap + 1] = val;
      WriteMove(data.length + 1, swap + 1);
    }
  }
  return ncomps;
}
