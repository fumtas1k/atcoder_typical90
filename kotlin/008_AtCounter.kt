/** 008 - AtCounter（★4）
 * 状態DP法
 */

fun main() {
  val MOD = 1_000_000_007
  val N = readLine()!!.toInt()
  val S = readLine()!!.toList()
  val T = "atcoder".toList()

  val dp = MutableList(N + 1) { MutableList(T.size + 1) { 0 } }
  dp[0][0] = 1

  for (i in S.indices) {
    for (j in 0 .. T.size) {
      dp[i + 1][j] += dp[i][j]
      if (j < T.size && S[i] == T[j]) dp[i + 1][j + 1] += dp[i][j]
      dp[i + 1][j] %= MOD
    }
  }

  println(dp[N][T.size])
}
