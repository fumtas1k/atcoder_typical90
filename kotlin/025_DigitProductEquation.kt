/**
 * 025 - Digit Product Equation（★7）
 * 再帰関数
 */

fun solve() {
  fun f(x: Long) = x.toString().toList().map(Character::getNumericValue).fold(1L) {acc, i -> acc * i}
  val (N, B) = readLine()!!.split(" ").map(String::toLong)

  val fm = mutableListOf<Long>()
  fm.add(0)
  fun dfs(remain: Int, next: Int,  num: Long) {
    if (remain == 0) {
      fm.add(num)
      return
    }
    (next .. 9).forEach { dfs(remain - 1, it, num * it) }
  }
  dfs(N.toString().length, 1, 1L)

  val ans = fm.distinct().count {
    val m = B + it
    if (m <= N) it == f(m) else false
  }

  println(ans)
}

fun main() {
  Thread(null, ::solve, "solve", 1.shl(26)).start()
}
