/**
 * 001 - Yokan Party（★4）
 * 貪欲法
 * 二分探索法
 */
fun main() {
  val (N, L) = readLine()!!.split(" ").map(String::toInt)
  val K = readLine()!!.toInt()
  val A = readLine()!!.split(" ").map(String::toInt).toMutableList()

  fun isCut(len: Int): Boolean {
    var cnt = 0
    var pre = 0
    for (a in A) {
      if (a - pre < len || L - a < len) continue
      cnt++
      pre = a
    }
    return cnt >= K
  }

  var left = 0
  var right = L + 1
  while (right - left > 1) {
    val mid = (right + left) / 2
    if (isCut(mid)) left = mid else right = mid
  }
  println(left)
}
