import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;
import java.util.Collections;

int numNodes = 7;
ArrayList<ArrayList<Integer>> adj;

void setup() {
  size(400, 400);

  buildSampleGraph();

  int startNode = 0;
  println("Start Node: " + startNode);
  println("BFS Order: " + bfs(startNode));
  println("DFS Order (Stack): " + dfsIterative(startNode));
  println("DFS Order (Recursive): " + dfsRecursiveOrder(startNode));
}

void draw() {
}

// 무방향 그래프 인접 리스트 구성
void buildSampleGraph() {
  adj = new ArrayList<ArrayList<Integer>>();
  for (int i = 0; i < numNodes; i++) {
    adj.add(new ArrayList<Integer>());
  }

  addEdge(0, 1);
  addEdge(0, 2);
  addEdge(1, 3);
  addEdge(1, 4);
  addEdge(2, 5);
  addEdge(4, 6);

  // 결정적(deterministic) 순회를 위해 인접 정점 정렬
  for (int i = 0; i < numNodes; i++) {
    Collections.sort(adj.get(i));
  }
}

void addEdge(int u, int v) {
  adj.get(u).add(v);
  adj.get(v).add(u);
}

// 1. BFS (큐 사용)
ArrayList<Integer> bfs(int start) {
  ArrayList<Integer> order = new ArrayList<Integer>();
  boolean[] visited = new boolean[numNodes];
  Queue<Integer> queue = new LinkedList<Integer>();

  visited[start] = true;
  queue.add(start);

  while (!queue.isEmpty()) {
    int curr = queue.poll();
    order.add(curr);

    for (int next : adj.get(curr)) {
      if (!visited[next]) {
        visited[next] = true;
        queue.add(next);
      }
    }
  }
  return order;
}

// 2. DFS - 반복문/스택 사용
ArrayList<Integer> dfsIterative(int start) {
  ArrayList<Integer> order = new ArrayList<Integer>();
  boolean[] visited = new boolean[numNodes];
  Stack<Integer> stack = new Stack<Integer>();

  stack.push(start);

  while (!stack.isEmpty()) {
    int curr = stack.pop();
    if (visited[curr]) continue;

    visited[curr] = true;
    order.add(curr);

    // 인접 노드를 역순으로 push해야 작은 번호부터 방문
    ArrayList<Integer> neighbors = adj.get(curr);
    for (int i = neighbors.size() - 1; i >= 0; i--) {
      int next = neighbors.get(i);
      if (!visited[next]) {
        stack.push(next);
      }
    }
  }
  return order;
}

// 3. DFS - 재귀 래퍼
ArrayList<Integer> dfsRecursiveOrder(int start) {
  ArrayList<Integer> order = new ArrayList<Integer>();
  boolean[] visited = new boolean[numNodes];
  dfsRecursive(start, visited, order);
  return order;
}

void dfsRecursive(int curr, boolean[] visited, ArrayList<Integer> order) {
  visited[curr] = true;
  order.add(curr);

  for (int next : adj.get(curr)) {
    if (!visited[next]) {
      dfsRecursive(next, visited, order);
    }
  }
}
