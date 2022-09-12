package java;

import java.util.*;

/**
 * 008 - AtCounter（★4）
 * 状態DP法
 */
public class AtCounter_008 {

  private static final int MOD = (int) Math.pow(10, 9) + 7;
  private static final String[] T = "atcoder".split("");
  private static int N;
  private static String[] S;
  private static int[][] dp;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    N = sc.nextInt();
    S = sc.next().split("");

    dp = new int[N + 1][T.length + 1];
    for (int i = 0; i < N + 1; i++) {
      dp[i][0] = 1;
    }

    for (int i = 0; i < N; i++) {
      for (int j = 0; j < T.length; j++) {
        dp[i + 1][j + 1] = dp[i][j + 1];
        if (S[i].equals(T[j])) {
          dp[i + 1][j + 1] += dp[i][j];
          dp[i + 1][j + 1] %= MOD;
        }
      }
    }
    System.out.println(dp[N][T.length]);
  }
}
