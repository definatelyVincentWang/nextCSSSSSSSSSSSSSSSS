void InsertionSort(int[] array) {
  for (int compare = 1; compare < array.length; compare++) {
    int val = array[compare];
    int swap = compare - 1;
    for (; swap >= 0; swap--) {
      if (val < array[swap]) {
        array[swap] = array[swap + 1];
      }
    }
    array[swap+1] = val;
  }
}
