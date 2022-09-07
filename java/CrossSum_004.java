package java;

import java.util.*;
import java.util.stream.*;

/**
 * 004 - Cross Sum（★2）
 * 包除原理
 */
public class CrossSum_004 {

  static int H;
  static int W;
  static int[][] A;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    H = sc.nextInt();
    W = sc.nextInt();
    A = new int[H][W];

    for (int i = 0; i < H; i++) {
      for (int j = 0; j < W; j++) {
        A[i][j] = sc.nextInt();
      }
    }

    int[] rowSum = new int[H];
    rowSum[0] = 0;
    int[] colSum = new int[W];
    colSum[0] = 0;

    for (int i = 0; i < H; i++) {
      for (int j = 0; j < W; j++) {
        rowSum[i] += A[i][j];
        colSum[j] += A[i][j];
      }
    }

    for (int i = 0; i < H; i++) {
      int[] ans = new int[W];
      for (int j = 0; j < W; j++) {
        ans[j] = rowSum[i] + colSum[j] - A[i][j];
      }
      System.out.println(Arrays.stream(ans).mapToObj(String::valueOf).collect(Collectors.joining(" ")));
    }
    sc.close();
  }
}
