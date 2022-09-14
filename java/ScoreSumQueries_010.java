package java;

import java.util.*;

/**
 * 010 - Score Sum Queries（★2）
 * 累積和
 */
public class ScoreSumQueries_010 {

  private static int N;
  private static int Q;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    N = sc.nextInt();

    int[] cSum1 = new int[N + 1];
    int[] cSum2 = new int[N + 1];

    for (int i = 0; i < N; i++) {
      int c = sc.nextInt();
      int p = sc.nextInt();
      cSum1[i + 1] = cSum1[i];
      cSum2[i + 1] = cSum2[i];
      if (c == 1) cSum1[i + 1] += p;
      else cSum2[i + 1] += p;
    }

    Q = sc.nextInt();
    for (int i = 0; i < Q; i++) {
      int l = sc.nextInt();
      int r = sc.nextInt();
      System.out.println((cSum1[r] - cSum1[l - 1]) + " " + (cSum2[r] - cSum2[l - 1]));
    }

    sc.close();
  }
}
