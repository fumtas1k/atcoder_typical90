package java;

import java.util.*;

/**
 * 006 - Smallest Subsequence（★5）
 * 貪欲法
 * 辞書順最小
 */
public class SmallestSubsequence_006 {

  static final int ALPHABET = 26;
  static final int aORD = 'a';
  static int N;
  static int K;
  static char[] S;
  static int[][] nex;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    N = sc.nextInt();
    K = sc.nextInt();
    S = sc.next().toCharArray();

    /** 前計算（インデックスを記録) */
    nex = new int[N + 1][ALPHABET];
    for (int i = 0; i < ALPHABET; i++) nex[N][i] = N;
    /** Sのindexがiの時点で最も左にある(char) (aORD + j)のSでのindexをメモ */
    for (int i = N - 1; i >= 0; i--) {
      for (int j = 0; j < ALPHABET; j++) {
        nex[i][j] = nex[i + 1][j];
      }
      nex[i][(int) S[i] - aORD] = i;
    }

    /** Sのindex番号をposに代入. 0から開始 */
    int pos = 0;
    StringBuilder ans = new StringBuilder("");
    /** 1文字ずつ貪欲に求める */
    for (int k = K; k > 0; k--) {
      for (int i = 0; i < ALPHABET; i++) {
        /** (char) (aORD + j) のSでのindexをnextPosに代入 */
        int nextPos = nex[pos][i];
        /** nextPosの位置の文字を選択した時、残り文字数が足りているか確認 */
        if (N - nextPos < k) continue;
        ans.append(S[nextPos]);
        pos = nextPos + 1;
        break;
      }
    }

    System.out.println(ans);

    sc.close();
  }
}
