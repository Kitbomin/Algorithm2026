int[][] arr;
int loop;

// 범용성을 위한 상수 정의 (m: 총 단계/행 개수, n: 배열의 원소 개수)
int m = 16;
int n = 16;

void setup() {
  size(800, 600);
  intArr(m, n);
  printArr();
  selectionSorting();
  printArr();
}

void intArr(int rows, int cols) {
  int i;
  arr = new int[rows][cols];
  for(i = 0; i < arr[0].length; i++) {
    // loop 번째 행의 i번째 열에 랜덤 값 초기화
    arr[loop][i] = (int) random(100);
  }
}

void printArr() {
  int i, j;
  for(j = 0; j < arr.length; j++) {
    for(i = 0; i < arr[0].length; i++) {
      print(arr[j][i], " ");
    }
    println();  
  } 
  println("-----------------------------------");
}

void selectionSorting() {
  int i, j, max, index, tmp;
  for(i = 0; i < arr[0].length - 1; i++) {
    max = index = -1;
    copy(loop, loop + 1); // 이전 상태를 다음 행으로 복사
    loop++;
    
    // 정렬 범위 설정 (n 크기 기준)
    for(j = 0; j < arr[0].length - i; j++) {
      if(max < arr[loop][j]) {
        index = j;
        max = arr[loop][j];
      }
    }
    // 최댓값과 올바른 자리 교환 (Swap)
    tmp = arr[loop][arr[0].length - i - 1];
    arr[loop][arr[0].length - i - 1] = max;
    arr[loop][index] = tmp;
  } 
}

void draw() {
  int i;
  float mx, dx, my, dy;
  background(32);
  mx = my = 20.;
  dx = (width - 2 * mx) / arr[0].length;
  dy = (height - 2 * my) / 100;
  
  for(i = 0; i < arr[0].length; i++) {
    rect(mx + dx * i, height - dy * arr[loop][i] - my, dx, dy * arr[loop][i]);
  }
}

void keyPressed() {
  if(key == 'n') {
    loop++;
    if(loop >= m) loop = 0; // m 상수에 맞춰 순환
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    loop++;
    if(loop >= m) loop = 0; // m 상수에 맞춰 순환
  }
  else if(mouseButton == RIGHT) {
    loop--;
    if(loop < 0) loop = m - 1; // m 상수에 맞춰 순환
  }
}

void copy(int fromRow, int toRow) { // 행 단위 복사 함수
  int k;
  for(k = 0; k < arr[0].length; k++) {
    arr[toRow][k] = arr[fromRow][k];
  }   
}
