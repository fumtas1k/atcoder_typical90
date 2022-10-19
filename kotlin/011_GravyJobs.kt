/**
 * 011 - Gravy Jobs（★6）
 * DP法, 締め切りが早い順
 */

fun main() {
  val N = readLine()!!.toInt()
  val DCS = MutableList(N) { readLine()!!.split(" ").map(String::toInt) }.sortedBy { it.first() }

  val dp = MutableList(5001) { 0L }

  for ((d, c, s) in DCS) {
    for (i in d downTo c) {
      dp[i] = Math.max(dp[i], dp[i - c] + s)
    }
  }

  println(dp.max())

}
