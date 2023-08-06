/**
 * 030 - K Factors
 * エラトステネスの篩
 */

fun main() {
  val (N, K) = readLine()!!.split(" ").map(String::toInt)
  val primeFactors = MutableList<Int>(N + 1) { 0 }
  (2 .. N).forEach { i ->
    if (primeFactors[i] > 0) return@forEach
    (i .. N step i).forEach { primeFactors[it]++ }
  }
  println(primeFactors.count { it >= K })
}
