/** 056 - Lucky Bag（★5）
 * 動的計画法, DP法
 * DP復元
 */

fun readInts() = readLine()!!.split(" ").map(String::toInt)

fun main() {
  val (N, S) = readInts()
  val AB = Array(N) { readInts() }
  var dp = Array(N + 1) { BooleanArray(S + 1) {false} }
  dp[0][0] = true

  for (i in 0 .. N - 1) {
    for (j in 0 .. S) {
      for (x in AB[i]) {
        if (j < x) continue
        if (dp[i][j - x]) dp[i + 1][j] = true
      }
    }
  }

  if (dp[N][S]) {
    var ansRev = StringBuilder()
    var pos = S

    for (i in N - 1 downTo 0) {
      val (a, b) = AB[i]
      if (pos >= a && dp[i][pos - a]) {
        ansRev.append("A")
        pos -= a
      }
      else {
        ansRev.append("B")
        pos -= b
      }
    }
    println(ansRev.reversed())
  } else {
    println("Impossible")
  }
}
