package java;

import java.util.*;

/**
 * 011 - Gravy Jobs（★6）
 * DP法
 * 締め切りが早い順
 */
public class GravyJobs_011 {

  private static int N;
  private static int[][] DCS;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    N = sc.nextInt();
    DCS = new int[N][3];

    for (int i = 0; i < N; i++) {
      for (int j = 0; j < 3; j++) {
        DCS[i][j] = sc.nextInt();
      }
    }
    Arrays.sort(DCS, (a, b) -> a[0] - b[0]);

    int lastD = DCS[N - 1][0];
    long[] dp = new long[lastD + 1];

    for (int i = 0; i < N; i++) {
      for (int j = DCS[i][0]; j >= DCS[i][1]; j--) {
        dp[j] = Math.max(dp[j], dp[j - DCS[i][1]] + DCS[i][2]);
      }
    }

    // 仕事iをする場合としない場合のうち最大値を取る
    long ans = Arrays.stream(dp).max().getAsLong();
    System.out.println(ans);

    sc.close();
  }
}
