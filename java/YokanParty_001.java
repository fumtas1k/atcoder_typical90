package java;
/**
 * 001 - Yokan Party（★4）
 * 貪欲法
 * 二分探索法
 */

import java.util.*;

public class YokanParty_001 {

  static int N;
  static int L;
  static int K;
  static int[] A;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    N = sc.nextInt();
    L = sc.nextInt();
    K = sc.nextInt();
    A = new int[N];
    for (int i = 0; i < N; i++) {
      A[i] = sc.nextInt();
    }

    /* 2分探索 */
    int left = 0;
    int right = L + 1;
    while (right - left > 1) {
      int mid = (int) (right + left) / 2;
      if (isCutting(mid)) left = mid;
      else right = mid;
    }

    System.out.println(left);

    sc.close();
  }

  /**
   * カット可能か判断
   *
   * @param c カット数
   * @return boolean
   */
  public static boolean isCutting(int c) {
    int cnt = 0;
    int pre = 0;
    for (int i : A) {
      if (i - pre < c || L - i < c) continue;
      cnt++;
      pre = i;
    }
    return cnt >= K;
  }
}
