int SelectionSort(int[] data) {
  int temp;
  int ncomps = 0;
   for (int i = 0; i < data.length; i++) {
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
      WriteSwap(i,pos,true);
   }
   return ncomps;
}
