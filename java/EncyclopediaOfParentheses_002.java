package java;

import java.util.*;

/**
 * 002 - Encyclopedia of Parentheses（★3）
 * bit全探索
 * 正しい括弧列の条件
 */

public class EncyclopediaOfParentheses_002 {

  static int N;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    N = sc.nextInt();
    List<StringBuilder> brackets = new ArrayList<>();

    for (int i = 0; i < (1 << N); i++) {
      StringBuilder bracket = new StringBuilder("");
      for (int j = 0; j < N; j++) {
        if ((i >> j & 1) == 0) {
          bracket.append("(");
        } else {
          bracket.append(")");
        }
      }
      if (isBracket(bracket)) brackets.add(bracket);
    }

    Collections.sort(brackets);

    for (StringBuilder bracket : brackets) {
      System.out.println(bracket);
    }

    sc.close();
  }

  /**
   * ブラケットか判断
   *
   * @param bracket ブラケットもどき
   * @return boolean
   */
  public static boolean isBracket(StringBuilder bracket) {
    int cnt = 0;
    for (int i = 0; i < bracket.length(); i++) {
      if ((bracket.charAt(i)) == '(') cnt++;
      else cnt--;
      if (cnt < 0) return false;
    }
    return cnt == 0;
  }
}
