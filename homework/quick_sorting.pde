void setup() {
  int[] list = new int[10];
  for(int i = 0; i < list.length; i++){
    list[i] = (int)random(10);
  }
  println("b; " + java.util.Arrays.toString(list));
  quickSort(list, 0, list.length -1);
  println("a: " + java.util.Arrays.toString(list));
}

void quickSort(int[] list, int p, int r){
  if(p<r) {
    int q = partition(list, p, r);
    quickSort(list, p, q-1);
    quickSort(list, q+1, r);
 }
}

int partition(int[] list, int p, int r){
  int pivot = list[r];
  int i = p -1;
  
  for (int j = p; j < r; j++) {
    if (list[j] < pivot) {
      i++;
      swap(list, i, j); 
    }
    println(java.util.Arrays.toString(list));
  }
  
  swap(list, i + 1, r);
  return i + 1;
}

void swap(int[] arr, int small, int big) {
  int tmp;
  tmp = arr[small];
  arr[small] = arr[big];
  arr[big] = tmp;
}
