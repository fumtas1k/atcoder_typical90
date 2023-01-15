/**
 * 042 - Multiple of 9（★4）
 * dp, 動的計画法
 */

fun main() {
  val MOD = 1000_000_000 + 7
  val K = readLine()!!.toInt()
  val dp = MutableList(K + 1) { 0 }
  dp[0] = 1

  if (K % 9 == 0) {
    for (i in 1 .. K) {
      for (j in 1 .. 9) {
        if (i >= j) dp[i] += dp[i - j] % MOD
        dp[i] %= MOD
      }
    }
  }
  println(dp[K])
}
