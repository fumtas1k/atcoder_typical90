/**
 * 052 - Dice Product（★3）
 * 因数分解
 */

fun main() {
  val M = 1_000_000_007L
  val N = readLine()!!.toInt()
  val A = List(N) { readLine()!!.split(" ").map(String::toLong) }
  val ans = A.fold(1L) { acc, a -> acc * a.sum() % M }
  println(ans)
}
