package java;

import java.util.*;
import java.util.stream.*;

/**
 * 014 - We Used to Sing a Song Together（★3）
 * 貪欲法
 * ソート
 */
public class WeUsedToSingSongTogether_014 {

  public static void main(String[] args) {
    var sc = new Scanner(System.in);
    var N = sc.nextInt();
    Long[] A = new Long[N];
    Long[] B = new Long[N];
    for (int i = 0; i < N; i++) A[i] = sc.nextLong();
    for (int i = 0; i < N; i++) B[i] = sc.nextLong();
    Arrays.sort(A);
    Arrays.sort(B);
    var ans = IntStream.range(0, N).mapToLong(i -> Math.abs(A[i] - B[i])).sum();
    System.out.println(ans);
  }
}
