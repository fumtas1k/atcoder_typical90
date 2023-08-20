/**
 * 015 - Don't be too close（★6）
 * 調和級数
 * 逆元
 * フェルマーの小定理
 */

import java.io.PrintWriter

 /**
 * 順列・組み合わせ
 * @property size サイズ
 * @property mod 除数
 */
class PermComb(
  private val size: Int,
  private val mod: Int
) {
  // 階乗
  private val fact = LongArray(size + 1) { 1L }
  // 階乗の逆数
  private val invFact = LongArray(size + 1) { 1L }

  init { prepare() }

  /**
   * 順列
   *
   * @param n 位数
   * @param r 選ぶ個数
   * @return 場合の数
   */
  fun perm(n: Int, r: Int): Long {
    if (n < 0 || r < 0 || n < r) return 0L
    return fact[n] * invFact[r] % mod
  }

  /**
   * 組み合わせ
   *
   * @param n 位数
   * @param r 選ぶ個数
   * @return 場合の数
   */
  fun comb(n: Int, r: Int): Long {
    if (n < 0 || r < 0 || n < r) return 0L
    return perm(n, r) * invFact[n - r] % mod
  }

  /**
   * 準備
   */
  private fun prepare() {
    (2 .. size).forEach {
      fact[it] = fact[it - 1] * it % mod
      invFact[it] = invFact[it - 1] * pow(it, mod - 2) % mod
    }
  }

  /**
   * 冪剰余
   *
   * @param x 底
   * @param n 指数
   * @return 冪剰余
   */
  private fun pow(x: Int, n: Int): Long {
    var base = x.toLong()
    var exp = n
    var ans = 1L
    while (exp > 0) {
      if (exp.and(1) == 1) ans = ans * base % mod
      exp /= 2
      base = base * base % mod
    }
    return ans
  }
}

fun main() {
  val MOD = 1_000_000_007
  val N = readLine()!!.toInt()

  val permComb = PermComb(N + 1, MOD)

  val pw = PrintWriter(System.out, false)

  (1 .. N).forEach k@ { k ->
    var ans = 0L
    (1 .. (N / k + 1)).forEach { r ->
      val n = N - (k - 1) * (r - 1)
      if (n < 0) return@k
      ans += permComb.comb(n, r)
      ans %= MOD
    }
    pw.println(ans)
  }
  pw.flush()
  pw.close()
}
