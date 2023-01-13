/**
 * 004 - Cross Sum（★2）
 * 包除原理
 */

fun main() {
  val (H, W) = readLine()!!.split(" ").map(String::toInt)
  val A = List(H) { readLine()!!.split(" ").map(String::toInt) }

  val rSums = A.map { it.sum() }
  val cSums = (0 until W).map { c -> A.sumBy { it[c] } }

  for (i in 0 until H) {
    val ans = A[i].mapIndexed { j, v -> rSums[i] + cSums[j] - v }
    println(ans.joinToString(" "))
  }
}
