/**
 * 050 - Stair Jump
 * DP法
 */

fun main() {
  val MOD = 1_000_000_000 + 7
  val (N, L) = readLine()!!.split(" ").map(String::toInt)

  val dp = MutableList<Int>(N + 1) { 0 }
  dp[0] = 1

  for (i in 0 .. N) {
    if (i + L <= N) dp[i + L] = (dp[i + L] + dp[i]) % MOD
    if (i + 1 <= N) dp[i + 1] = (dp[i + 1] + dp[i]) % MOD
  }

  println(dp[N])
}
