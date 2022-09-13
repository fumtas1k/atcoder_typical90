package java;

import java.util.*;

/**
 * 009 - Three Point Angle（★6）
 *
 * 二分探索法
 * 偏角ソート
 * 真ん中決め打ち
 */
public class ThreePointAngle_009 {

  private static int N;
  private static Pos[] posList;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    N = sc.nextInt();

    posList = new Pos[N];
    for (int i = 0; i < N; i++) {
      posList[i] = new Pos(sc.nextInt(), sc.nextInt());
    }

    List<Double> ans = new ArrayList<>();
    for (int i = 0; i < N; i++) ans.add(0.0);

    for (int i = 0; i < N; i++) {
      List<Double> angles = new ArrayList<>();
      for (int j = 0; j < N; j++) {
        if (i == j) continue;
        angles.add(computeAngle(posList[i].minus(posList[j])));
      }

      Collections.sort(angles);

      for (Double angle : angles) {
        Double target = (angle + 180) % 360;
        int left = 0;
        int right = angles.size() - 1;
        while (right - left > 1) {
          int mid = (int) (left + right) / 2;
          if (angles.get(mid) <= target) left = mid;
          else right = mid;
        }

        Double temp = Math.max(computeAmplitude(angles.get(left), angle), computeAmplitude(angles.get(right), angle));
        ans.set(i, Math.max(ans.get(i), temp));
      }
    }
    System.out.println(Collections.max(ans));

    sc.close();
  }

  public static Double computeAngle(Pos pos) {
    Double posAngleRad = Math.atan2(pos.y, pos.x);
	posAngleRad += (posAngleRad >= 0 ? 0 : 2 * Math.PI);
    return posAngleRad * 180 / Math.PI;
  }

  public static Double computeAmplitude(Double angle1, Double angle2) {
    Double amplitude = Math.abs(angle1 - angle2);
    return (amplitude <= 180 ? amplitude : 360 - amplitude);
  }
}

/**
 * Struct(DTO)
 */
class Pos {
  public int x;
  public int y;

  public Pos(int x, int y) {
    this.x = x;
    this.y = y;
  }

  /**
   * 引き算
   *
   * @param pos Posインスタンス
   * @return Posインスタンス
   */
  public Pos minus(Pos pos) {
    return new Pos(this.x - pos.x, this.y - pos.y);
  }
}
