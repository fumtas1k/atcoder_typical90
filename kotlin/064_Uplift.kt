/**
 * 064 - Uplift（★3）
 * 階差
 */

 fun main() {
  val (N, Q) = readLine()!!.split(" ").map(String::toInt)
  val A = readLine()!!.split(" ").map(String::toLong)
  val LRV = Array(Q) { readLine()!!.split(" ").map(String::toInt) }
  val diffs = (1 .. N - 1).map { A[it] - A[it - 1] }.toTypedArray()
  // sumByの戻り値はInt型になるためsumByは使用せず
  var inconvinience = diffs.map { Math.abs(it) }.sum()

  val ans = LongArray(Q)

  repeat(Q) { i ->
    val l = LRV[i][0] - 1
    val r = LRV[i][1] - 1
    val v = LRV[i][2].toLong()
    if (l > 0) {
      val preDiff = diffs[l - 1]
      diffs[l - 1] += v
      inconvinience += Math.abs(diffs[l - 1]) - Math.abs(preDiff)
    }
    if (r < N - 1) {
      val preDiff = diffs[r]
      diffs[r] -= v
      inconvinience += Math.abs(diffs[r]) - Math.abs(preDiff)
    }
    ans[i] = inconvinience

  }
  ans.forEach(::println)
}
