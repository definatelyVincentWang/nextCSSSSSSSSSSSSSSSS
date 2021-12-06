void SelectionSort(int[] array) {
   for (int i = 0; i < array.length; i++) {
      int pos = i + 1;
      for (int min = i + 2; min < array.length; min++) {
         if (array[min] < array[pos]) {
            pos = min;
         }
      }
      int temp = array[i];
      array[i] = array[pos];
      array[pos] = temp;
   }
}
