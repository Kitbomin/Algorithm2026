import java.util.ArrayDeque;
import java.util.Deque;

void setup() {
  size(400, 300);
  
  String infix = "(3 + 4) * 2 - 8 / 4";
  String postfix = infixToPostfix(infix);
  int result = evalPostfix(postfix);
  
  println("Infix   : " + infix);
  println("Postfix : " + postfix);
  println("Result  : " + result);
}

void draw() {
}

int precedence(char op) {
  if (op == '+' || op == '-') return 1;
  if (op == '*' || op == '/') return 2;
  return 0;
}

boolean isOperator(char c) {
  return c == '+' || c == '-' || c == '*' || c == '/';
}

// 중위 표기식 -> 후위 표기식 (공백으로 토큰 구분)
String infixToPostfix(String expr) {
  Deque<Character> stack = new ArrayDeque<Character>();
  StringBuilder out = new StringBuilder();
  int i = 0;
  
  while (i < expr.length()) {
    char c = expr.charAt(i);
    
    if (c == ' ') {
      i++;
      continue;
    }
    
    // 한 자리 이상 숫자 처리
    if (Character.isDigit(c)) {
      while (i < expr.length() && Character.isDigit(expr.charAt(i))) {
        out.append(expr.charAt(i));
        i++;
      }
      out.append(' ');
      continue;
    }
    
    if (c == '(') {
      stack.push(c);
    } else if (c == ')') {
      while (!stack.isEmpty() && stack.peek() != '(') {
        out.append(stack.pop()).append(' ');
      }
      if (!stack.isEmpty() && stack.peek() == '(') {
        stack.pop();
      }
    } else if (isOperator(c)) {
      while (!stack.isEmpty() && stack.peek() != '(' &&
             precedence(stack.peek()) >= precedence(c)) {
        out.append(stack.pop()).append(' ');
      }
      stack.push(c);
    }
    i++;
  }
  
  while (!stack.isEmpty()) {
    out.append(stack.pop()).append(' ');
  }
  
  return out.toString().trim();
}

// 후위 표기식 계산
int evalPostfix(String postfix) {
  Deque<Integer> stack = new ArrayDeque<Integer>();
  String[] tokens = postfix.split("\\s+");
  
  for (int i = 0; i < tokens.length; i++) {
    String tok = tokens[i];
    if (tok.length() == 0) continue;
    
    if (tok.length() == 1 && isOperator(tok.charAt(0))) {
      int b = stack.pop();
      int a = stack.pop();
      char op = tok.charAt(0);
      
      if (op == '+') stack.push(a + b);
      else if (op == '-') stack.push(a - b);
      else if (op == '*') stack.push(a * b);
      else if (op == '/') stack.push(a / b);
    } else {
      stack.push(int(tok));
    }
  }
  
  return stack.pop();
}
