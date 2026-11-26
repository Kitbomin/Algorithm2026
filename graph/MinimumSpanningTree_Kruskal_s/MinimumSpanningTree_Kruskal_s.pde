import java.util.ArrayList;
import java.util.Collections;

class Edge implements Comparable<Edge> {
  int u;
  int v;
  int weight;

  Edge(int u, int v, int weight) {
    this.u = u;
    this.v = v;
    this.weight = weight;
  }

  public int compareTo(Edge other) {
    return Integer.compare(this.weight, other.weight);
  }

  public String toString() {
    return "(" + u + " - " + v + ", w=" + weight + ")";
  }
}

class UnionFind {
  int[] parent;
  int[] rank;

  UnionFind(int n) {
    parent = new int[n];
    rank = new int[n];
    for (int i = 0; i < n; i++) {
      parent[i] = i;
      rank[i] = 0;
    }
  }

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  boolean union(int a, int b) {
    int rootA = find(a);
    int rootB = find(b);
    if (rootA == rootB) return false;

    if (rank[rootA] < rank[rootB]) {
      parent[rootA] = rootB;
    } else if (rank[rootA] > rank[rootB]) {
      parent[rootB] = rootA;
    } else {
      parent[rootB] = rootA;
      rank[rootA]++;
    }
    return true;
  }
}

int numVertices = 6;
ArrayList<Edge> edges;

void setup() {
  size(400, 400);

  buildSampleGraph();
  ArrayList<Edge> mst = kruskalMST(numVertices, edges);

  int totalWeight = 0;
  println("MST Edges:");
  for (Edge e : mst) {
    println("  " + e);
    totalWeight += e.weight;
  }
  println("Total MST Weight: " + totalWeight);
}

void draw() {
}

void buildSampleGraph() {
  edges = new ArrayList<Edge>();
  edges.add(new Edge(0, 1, 4));
  edges.add(new Edge(0, 2, 4));
  edges.add(new Edge(1, 2, 2));
  edges.add(new Edge(1, 3, 5));
  edges.add(new Edge(2, 3, 5));
  edges.add(new Edge(2, 4, 11));
  edges.add(new Edge(3, 4, 9));
  edges.add(new Edge(3, 5, 7));
  edges.add(new Edge(4, 5, 1));
}

ArrayList<Edge> kruskalMST(int n, ArrayList<Edge> edgeList) {
  ArrayList<Edge> sortedEdges = new ArrayList<Edge>(edgeList);
  Collections.sort(sortedEdges);

  UnionFind uf = new UnionFind(n);
  ArrayList<Edge> mst = new ArrayList<Edge>();

  for (Edge e : sortedEdges) {
    if (uf.union(e.u, e.v)) {
      mst.add(e);
      println("Select " + e);
      if (mst.size() == n - 1) break;
    } else {
      println("Skip (cycle) " + e);
    }
  }

  return mst;
}
