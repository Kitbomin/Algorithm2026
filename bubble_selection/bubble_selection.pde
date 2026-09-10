void setup() {
  int[] list = new int[10];
  for(int i = 0; i < list.length; i++){
    list[i] = (int)random(10);
  }
  
  println("b; " + java.util.Arrays.toString(list));
  bubble(list);
  println("a: " + java.util.Arrays.toString(list));
}

void bubble(int[] list) {
  for(int i=0; i<list.length -1; i++){
    for(int j=0; j<list.length - 1 - i; j++){
      if (list[j] > list[j+1]) {
        swap(list, j, j+1);
      }
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
