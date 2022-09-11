package java;

import java.util.*;

/**
 * 007 - CP Classes（★3）
 * 二分探索法
 */
public class CPClasses_007 {

  static int N;
  static int[] A;
  static int Q;
  static int[] B;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    N = sc.nextInt();
    A = new int[N];
    for (int i = 0; i < N; i++) {
      A[i] = sc.nextInt();
    }

    Q = sc.nextInt();
    B = new int[Q];
    for (int i = 0; i < Q; i++) {
      B[i] = sc.nextInt();
    }

    Arrays.sort(A);
    StringBuilder ans = new StringBuilder("");
    for (int i = 0; i < Q; i++) {
      int b = B[i];
      int[] idx = binarySearchIndex(A, b);
      ans.append(Math.min(Math.abs(A[idx[0]] - b), Math.abs(A[idx[1]] - b)) + "\n");
    }

    System.out.print(ans);

    sc.close();
  }

  /**
   * 二分探索法
   * @param array 検索する配列
   * @param value 検索する値
   * @return 二分探索の右端と左端
   */
  private static int[] binarySearchIndex(int[] array, int value) {
    int left = 0;
    int right = array.length - 1;
    while (right - left > 1) {
      int mid = (int) (right + left) / 2;
      if (array[mid] <= value) left = mid;
      else right = mid;
    }
    int[] ans = new int[] {left, right};
    return ans;
  }
}
