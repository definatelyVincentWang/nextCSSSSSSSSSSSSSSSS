int SelectionSort(int[] data) {
  int temp;
  int ncomps = 0;
   for (int i = 0; i < data.length; i++) {
      WriteMove(i,data.length + 1);
      int pos = i;
      for (int min = i + 1; min < data.length; min++) {
         if (data[min] < data[pos]) {
            pos = min;
         }
         ncomps++;
      }
      temp = data[i];
      data[i] = data[pos];
      data[pos] = temp;
      WriteMove(pos, i);
      WriteMove(data.length + 1, pos);
   }
   return ncomps;
}
