package java;

import java.util.*;
import java.util.stream.*;

/**
 * 003 - Longest Circular Road（★4）
 * 木の直径
 * dfs
 */
public class LongestCircularRoad_003_02 {
  static int N;
  static List<Integer>[] G;
  static int[] dist;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    N = sc.nextInt();
    G = new ArrayList[N];

    for (int i = 0; i < N; i++) G[i] = new ArrayList<>();
    for (int i = 0; i < N - 1; i++) {
      int a = sc.nextInt() - 1;
      int b = sc.nextInt() - 1;
      G[a].add(b);
      G[b].add(a);
    }
    sc.close();

    dist = new int[N];
    dist[0] = 1;
    // dfsを用いて、頂点0(1)からの最短距離をdistに記録し、最短距離の最大となる頂点を特定する
    dfs(0);
    int max = Arrays.stream(dist).max().getAsInt();
    int maxId = Arrays.stream(dist).boxed().collect(Collectors.toList()).indexOf(max);

    dist = new int[N];
    dist[maxId] = 1;
    // 頂点max_idから、最短距離の最大値（木の直径）を求める
    dfs(maxId);

    System.out.println(Arrays.stream(dist).max().getAsInt());
  }

  /**
   * 深さ優先探索
   *
   * @param pos 開始位置
   */
  public static void dfs(int pos) {
    for (int i : G[pos]) {
      if (dist[i] != 0) continue;
      dist[i] = dist[pos] + 1;
      dfs(i);
    }
  }
}
