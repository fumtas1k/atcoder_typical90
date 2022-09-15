package java;

import java.util.*;
import java.util.stream.*;

/**
 * 012 - Red Painting（★4）
 * Union-Find
 */
public class RedPainting_012 {

  private static int H;
  private static int W;
  private static int Q;
  private static int[] query;
  private static final int[][] DIRECTS = {{1, 0}, {0, 1}, {-1, 0}, {0, -1}};

  public static void main(String[] args) {

    Scanner sc = new Scanner(System.in);
    H = sc.nextInt();
    W = sc.nextInt();
    Q = sc.nextInt();

    UnionFind unionFind = new UnionFind(H * W);
    boolean[][] reds = new boolean[H][W];

    StringBuilder ans = new StringBuilder("");

    for (int i = 0; i < Q; i++) {
      if (sc.nextInt() == 1) {
        int r = sc.nextInt() - 1;
        int c = sc.nextInt() - 1;
        reds[r][c] = true;

        for (int[] direct : DIRECTS) {
          int nr = r + direct[0];
          int nc = c + direct[1];
          if (nr < 0 || nr >= H || nc < 0 || nc >= W || !reds[nr][nc]) continue;
          unionFind.unite(r * W + c, nr * W + nc);
        }
      } else {
        int ra = sc.nextInt() - 1;
        int ca = sc.nextInt() - 1;
        int rb = sc.nextInt() - 1;
        int cb = sc.nextInt() - 1;

        String temp = "No";
        if (reds[ra][ca] && reds[rb][cb]) {
          if (unionFind.isSame(ra * W + ca, rb * W + cb)) temp = "Yes";
        }
        ans.append(temp + "\n");
      }
    }
    System.out.println(ans);
    sc.close();
  }
}

/** UnionFind */
class UnionFind {

  private int[] parents;

  public UnionFind(int size) {
    this.parents = IntStream.range(0, size).toArray();
  }

  /**
   * 親検索
   *
   * @param u 位置
   * @return 親の位置
   */
  public int root(int u) {
    if (u == parents[u]) return u;
    parents[u] = root(parents[u]);
    return parents[u];
  }

  /**
   * 結合
   * @param u 位置
   * @param v 位置
   */
  public void unite(int u, int v) {
    int root_u = root(u);
    int root_v = root(v);
    if (root_u != root_v) {
      parents[root_v] = root_u;
    }
  }

  /**
   * 親一致判定
   * @param u 位置
   * @param v 位置
   * @return boolean
   */
  public boolean isSame(int u, int v) {
    return root(u) == root(v);
  }
}
