package java;

import java.util.*;

/**
 * 013 - Passing (★5)
 * ダイクストラ法
 */
public class Passing_013 {

  private static int N;
  private static int M;
  private static List<Town>[] G;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    N = sc.nextInt();
    M = sc.nextInt();
    G = new ArrayList[N];
    for (int i = 0; i < N; i++) {
      G[i] = new ArrayList<>();
    }

    for (int i = 0; i < M; i++) {
      int a = sc.nextInt() - 1;
      int b = sc.nextInt() - 1;
      long c = sc.nextInt();
      G[a].add(new Town(b, c));
      G[b].add(new Town(a, c));
    }

    // 事前にコストを計算しておく
    long[] oneToN = dijkstra(0);
    long[] nToOne = dijkstra(N - 1);

    for (int i = 0; i < N; i++) {
      long ans = oneToN[i] + nToOne[i];
      System.out.println(ans);
    }
  }

  public static long[] dijkstra(int start) {
    long[] dist = new long[N];
    Arrays.fill(dist, Long.MAX_VALUE);
    dist[start] = 0;

    PriorityQueue<Town> log = new PriorityQueue<>();
    log.add(new Town(start, 0));

    while (!log.isEmpty()) {
      // 現時点での最小コストとなる街
      Town town = log.poll();
      int from = town.pos;

      if (dist[from] < town.cost) continue;

      for (Town tc : G[from]) {
        int to = tc.pos;
        long cost = dist[from] + tc.cost;
        if (dist[to] <= cost) continue;
        dist[to] = cost;

        log.add(new Town(to, dist[to]));
      }
    }
    return dist;
  }

  /** 街 */
  static class Town implements Comparable<Town> {
    int pos;
    long cost;

    public Town(int pos, long cost) {
      this.pos = pos;
      this.cost = cost;
    }

    /** {@inheritDoc} */
    @Override
    public int compareTo(Town other) {
      return Long.compare(cost, other.cost);
    }
  }
}
