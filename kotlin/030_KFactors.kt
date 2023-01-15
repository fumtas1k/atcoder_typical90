/**
 * 030 - K Factors
 * エラトステネスの篩
 */

 fun main() {
  val (N, K) = readLine()!!.split(" ").map(String::toInt)
  val primeFactors = MutableList<Int>(N + 1) { 0 }
  for (i in 2 .. N) {
    if (primeFactors[i] > 0) continue
    for (j in i .. N step i) primeFactors[j]++
  }
  println(primeFactors.count { it >= K })
}
