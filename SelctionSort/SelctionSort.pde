void setup() {
  int[] array = new int[10];
  for (int i = 0; i < array.length; i++) {
    array[i] = (int)random(10);
  }
  for (int i : array) {
    print(i + " ");
  }
  SelectionSort(array);
  println();
  for (int i : array) {
    print(i + " ");
  }
}

void SelectionSort(int[] array) {
   for (int i = 0; i < array.length; i++) {
      int pos = i;
      for (int min = i + 1; min < array.length; min++) {
         if (array[min] < array[pos]) {
            pos = min;
         }
      }
      int temp = array[i];
      array[i] = array[pos];
      array[pos] = temp;
   }
}
