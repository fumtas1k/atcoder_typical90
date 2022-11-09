package java;

import java.util.*;

/**
 * 021 - Come Back in One Piece（★5）
 * 強連結成分分解
 */
class ComeBackInOnePiece_021 {

  static int N;
  static int M;
  static List<List<Integer>> GOTO;
  static List<List<Integer>> BACKTO;
  static List<Boolean> used;
  static List<Integer> log;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    N = sc.nextInt();
    M = sc.nextInt();
    GOTO = new ArrayList<>(N + 1);
    BACKTO = new ArrayList<>(N + 1);
    used = new ArrayList<>(N + 1);
    log = new ArrayList<>(N);

    for (int i = 0; i <= N; i++) {
      GOTO.add(new ArrayList<Integer>());
      BACKTO.add(new ArrayList<Integer>());
      used.add(false);
    }

    for (int i = 0; i < M; i++) {
      var a = sc.nextInt();
      var b = sc.nextInt();
      GOTO.get(a).add(b);
      BACKTO.get(b).add(a);
    }

    for (int i = 1; i <= N; i++) dfs1(i);

    Collections.reverse(log);
    for (int i = 0; i <= N; i++) used.set(i, false);

    var ans = 0L;
    for (int i: log) {
      var cnt = dfs2(i);
      ans += cnt * (cnt - 1) / 2;
    }

    System.out.println(ans);
  }

  static void dfs1(int pos) {
    if (used.get(pos)) return;
    used.set(pos, true);
    GOTO.get(pos).forEach(ComeBackInOnePiece_021::dfs1);
    log.add(pos);
  }

  static long dfs2(int pos) {
    if (used.get(pos)) return 0;
    used.set(pos, true);
    var cnt = 1L;
    for (int i: BACKTO.get(pos)) cnt += dfs2(i);
    return cnt;
  }
}
