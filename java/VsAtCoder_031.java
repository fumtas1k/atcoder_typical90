package java;

import java.util.*;

/**
 * 031 - VS AtCoder（★6）
 * grundy
 */
public class VsAtCoder_031 {

  private static final int W_MAX = 50;
  private static final int B_MAX = W_MAX + W_MAX * (W_MAX + 1) / 2;

  private static int N;
  private static int[] W;
  private static int[] B;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    N = sc.nextInt();
    W = new int[N];
    B = new int[N];
    for (int i = 0; i < N; i++) W[i] = sc.nextInt();
    for (int i = 0; i < N; i++) B[i] = sc.nextInt();

    int[][] grundy = new int[W_MAX + 1][B_MAX + 1];

    for (int i = 0; i <= W_MAX; i++) {
      for (int j = 0; j <= B_MAX; j++) {
        boolean[] transit = new boolean[B_MAX + 1];

        if (i >= 1 && i + j <= B_MAX) transit[grundy[i - 1][i + j]] = true;

        if (j >= 2) {
          for (int k = 1; k <= j / 2; k++) transit[grundy[i][j - k]] = true;
        }

        for (int k = 0; k < B_MAX + 1; k++) {
          if (transit[k]) continue;
          grundy[i][j] = k;
          break;
        }
      }
    }

    int sumXor = 0;
    for (int i = 0; i < N; i++) sumXor ^= grundy[W[i]][B[i]];

    System.out.println(sumXor == 0 ? "Second" : "First");

    sc.close();
  }
}
