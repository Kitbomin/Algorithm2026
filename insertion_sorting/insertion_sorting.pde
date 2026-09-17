void setup() {
  int[] list = new int[10];
  for(int i = 0; i < list.length; i++){
    list[i] = (int)random(10);
  }
  println("b; " + java.util.Arrays.toString(list));
  insertion(list);
  println("a: " + java.util.Arrays.toString(list));
}

void insertion(int[] list){
  for(int i=0; i<list.length; i++){
    int j = i;
    
    while(j > 0 && list[j - 1] > list[j]){
      swap(list, j -1, j);
      j--; // 앞으로 j 한칸 땡기기
      println(java.util.Arrays.toString(list));
    }
  }
}

void swap(int[] arr, int small, int big) {
  int tmp;
  tmp = arr[small];
  arr[small] = arr[big];
  arr[big] = tmp;
}
