void setup() {
  int[] array = {5,6,4,1,23,4};
  for (int i : array) {
    print(i + " ");
  }
  QuickSort(array);
  println();
  for (int i : array) {
    print(i + " ");
  }
}

void QuickSort(int[] data) {
  QuickSort(data,0,data.length);
}

void QuickSort(int[] data, int min, int max) {
  if (max <= min) {
    return;
  }
  int pivot = data[max-1];
  int middle = 0;
  for (int i = min; i < max; i++) {
    if (data[i] < pivot) {
      int temp = data[i];
      data[i] = data[middle];
      data[middle] = temp;
      middle++;
    }
  }
  QuickSort(data,min,middle);
  QuickSort(data,middle,max);
}
