package java;

import java.util.*;

/**
 * 060 - Chimera（★5）
 * 最長増加部分列(LIS)
 * 二分探索
 */
public class Chimera_060 {

  private static int N;
  private static List<Integer> A = new ArrayList<>();

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    N = sc.nextInt();
    for (int i = 0; i < N; i++) A.add(sc.nextInt());
    List<Integer> B = new ArrayList<>(A);
    Collections.reverse(B);

    List<Integer> P = lis(A);
    List<Integer> Q = lis(B);

    List<Integer> answers = new ArrayList<>();
    for (int i = 0; i < N; i++) {
      answers.add(P.get(i) + Q.get(N - i - 1) - 1);
    }

    System.out.println(Collections.max(answers));

    sc.close();
  }

  /**
   * 最長増加部分列(LIS)の長さ取得
   * @param arr 求める配列
   * @return 最長増加部分列(LIS)の長さ
   */
  private static List<Integer> lis(List<Integer> arr) {
    List<Integer> ans = new ArrayList<>();
    List<Integer> dp = new ArrayList<>();
    dp.add(arr.get(0));

    for (int a : arr) {
      int left = -1;
      int right = dp.size();
      while (right - left > 1) {
        int mid = (int) ((right + left) / 2);
        if (a <= dp.get(mid)) right = mid;
        else left = mid;
      }
      if (right == dp.size()) dp.add(a);
      else dp.set(right, a);
      ans.add(right + 1);
    }
    return ans;
  }
}
