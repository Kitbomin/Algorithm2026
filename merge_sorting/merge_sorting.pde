void setup() {
  int[] list = new int[10];
  for(int i = 0; i < list.length; i++){
    list[i] = (int)random(10);
  }
  println("b; " + java.util.Arrays.toString(list));
  mergeSort(list, 0, list.length -1);
  println("a: " + java.util.Arrays.toString(list));
}

void mergeSort(int[] list, int p, int r){
  if(p<r) {
    int q = (p+r)/2;
    mergeSort(list, p, q);
    mergeSort(list, q+1, r);
    merge(list, p, q, r);
 }
}

void merge(int[] list, int p, int q, int r){
  int n1 = q - p + 1; // 왼쪽 배열 크기
  int n2 = r - q; //오른쪽
  
  int[] left = new int[n1];
  int[] right = new int[n2];
  
  //복사
  for(int i = 0; i<n1; i++){
    left[i] = list[p+i];
  }
  for(int j = 0; j<n2; j++){
    right[j] = list[q+1+j];
  }
  
  int i = 0;
  int j = 0;
  int k = p;
  
  
  while(i < n1 && j < n2){
    if(left[i] <= right[j]){
      list[k] = left[i];
      i++;
    } else {
      list[k] = right[j];
      j++;
    }
    k++;
    println(java.util.Arrays.toString(list));
  }
  
  while(i < n1){
    list[k] = left[i];
    i++;
    k++;
  }
  
  while(j < n2){
    list[k] = right[j];
    j++;
    k++;
  }
}

void swap(int[] arr, int small, int big) {
  int tmp;
  tmp = arr[small];
  arr[small] = arr[big];
  arr[big] = tmp;
}
