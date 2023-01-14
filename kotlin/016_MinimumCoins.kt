/**
 * 016 - Minimum Coins（★3）
 * 工夫した全探索
 */

fun main() {
  val MAX = 9_999
  val N = readLine()!!.toInt()
  val (A, B, C) = readLine()!!.split(" ").map(String::toInt).sorted().reversed()

  var ans = MAX
  for (a in Math.min(MAX, N / A) downTo 0) {
    for (b in Math.min(MAX - a, (N - A * a) / B) downTo 0) {
      val c = (N - A * a - B * b) / C
      val sum = a + b + c
      if (A * a + B * b + C * c == N) {
        ans = Math.min(ans, sum)
        break
      } else if (ans < sum) break
    }
  }
  println(ans)
}
