void setup() {
  size(600, 400); // 시작 창 크기 설정
  println("in setup");
}
// 시작 시 setup을 호출하고
void draw() {
  stroke(random(255), random(255), random(255));
  line(random(600),random(400),random(100), random(100));
  //line(0,0,random(100), random(100));
  // line(0,0,600,400); // 시작 창에 그림 그리기
  println("in draw");
}
// 그 뒤로는 계속 draw를 호출하게 됨

//play 시 창이 뜨게 됨 그 창의 크기는 100, 100임
