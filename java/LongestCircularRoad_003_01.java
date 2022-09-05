package java;

import java.util.*;
import java.util.stream.*;

/**
 * 003 - Longest Circular Road（★4）
 * 木の直径
 * bfs
 */
public class LongestCircularRoad_003_01 {

  static int N;
  static List<Integer>[] G;

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

    // 頂点1からの最短距離の最大値となる頂点
    int[] ans1 = bfs(0);

    //頂点max_idから、木の直径（最短距離の最大値）を求める
    int[] ans2 = bfs(ans1[1]);

    System.out.println(ans2[0]);
  }

  /**
   * 幅優先探索
   * startから各nodeの距離を計測
   *
   * @param start 開始位置
   * @return {最大値, 最終位置}
   */
  private static int[] bfs(int start) {
    int[] dist = new int[N];
    dist[start] = 1;

    List<Integer> log = new ArrayList<>();
    log.add(start);

    while (!log.isEmpty()) {
      int from = log.get(0); log.remove(0);
      for (int to : G[from]) {
        if (dist[to] != 0) continue;
        dist[to] = dist[from] + 1;
        log.add(to);
      }
    }

    int max = Arrays.stream(dist).max().getAsInt();
    int idx = Arrays.stream(dist).boxed().collect(Collectors.toList()).indexOf(max);
    int[] ans = {max, idx};

    return ans;
  }
}
