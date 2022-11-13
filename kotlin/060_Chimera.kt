/**
 * 060 - Chimera（★5）
 * 最長増加部分列(LIS)
 * 二分探索
 */

fun main() {
  val N = readLine()!!.toInt()
  val A = readLine()!!.split(" ").map(String::toInt)
  val P = lis(A)
  val Q = lis(A.reversed())

  val max = (0 until N).map { P[it] + Q[N - it - 1] - 1 }.max()
  println(max)
}

/**
 * 返す配列のi番目はi番目の値を最大とするLISの長さ
 * dpは短調増加だが、返す配列は短調増加ではない。
 * arr自体の最長増加部分列の長さはlisMemoのsize or 返り値の最大値で求まる
 */
fun lis(arr: List<Int>): MutableList<Int> {
  val lisMemo = mutableListOf<Int>()
  val result = mutableListOf<Int>()

  for (i in arr) {
    val idx = lisMemo.binarySearch(i).let { if (it >= 0) it else it.inv() }
    if (idx == lisMemo.size) lisMemo.add(i) else lisMemo.set(idx, i)
    result.add(idx + 1)
  }
  return result
}
