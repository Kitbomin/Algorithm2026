int[] arr;

void setup() {
  size(400, 400); 
  
  arr = new int[16];
  
  print("정렬 전: ");
  for(int i=0; i<arr.length; i++) {
    arr[i] = (int)random(100);
    print(arr[i] + " ");
  }
  println(); 
  
  for(int i=0; i<arr.length -1; i++){
    int maxIndex = i; 
    for(int j= i + 1; j<arr.length; j++){
      if(arr[j] < arr[maxIndex]) {
        maxIndex = j;
      }
    }
    int tmp = arr[i];
    arr[i] = arr[maxIndex];
    arr[maxIndex] = tmp;
  }

  for(int i=0; i<arr.length; i++) {
    print(arr[i] + " ");
  }
}
