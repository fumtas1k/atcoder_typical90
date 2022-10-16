/** 028 - Cluttered Paper（★4）
 * いもす法
 */

fun main() {
  val M = 1_000
  val N = readLine()!!.toInt()
  val cnt = MutableList(M + 1) { MutableList(M + 1) { 0 } }

  repeat(N) {
    val (lx, ly, rx, ry) = readLine()!!.split(" ").map(String::toInt)
    cnt[ly][lx] += 1
    cnt[ly][rx] -= 1
    cnt[ry][lx] -= 1
    cnt[ry][rx] += 1
  }

  for (i in 0 .. M) {
    for (j in 1 .. M) {
      cnt[i][j] += cnt[i][j - 1]
    }
  }

  for (i in 1 .. M) {
    for (j in 0 .. M) {
      cnt[i][j] += cnt[i - 1][j]
    }
  }

  val ans = MutableList(N + 1) { 0 }

  cnt.flatten().forEach { ans[it] += 1 }

  for (i in 1 .. N) println(ans[i])
}
