class ArrayList {
  private Object[] array;
  private int length = 0;
  
  public ArrayList() {
    array = new Object[100];
  }
  public Object get(int pos) {
    return array[pos];
  }
  
  public void clear() {
    array = new Object[100];
    length = 0;
  }
  
  public int get(Object j) {
    for (int i = 0; i < array.length; i++) {
      if (array[i].equals(j)) {
        return i;
      }
    }
    throw new IllegalArgumentException("Object not found");
  }
  
  public void add(Object i) {
    if (length > array.length) {
      reallocate();
    }
    array[length] = i;
    length++;
  }
  
  public Object remove(int pos) {
    Object removed = array[pos];
    for (int i = pos + 1; i < length; i++ ) {
      array[i-1] = array[i];
    }
    length--;
    array[length] = 0;
    return removed;
  }
  
  public int remove(Object ob) {
    for (int i = 0; i < array.length; i++) {
      if (array[i].equals(ob)) {
        remove(i);
        return i;
      }
    }
    throw new IllegalArgumentException("Object not found");
  }
  
  public int size() {
    return length;
  }
  
  private void reallocate() {
    Object[] temp = array.clone();
    array = new Object[array.length * 2];
    for (int i = 0; i < temp.length; i++) {
      array[i] = temp[i];
    }
  }
}
