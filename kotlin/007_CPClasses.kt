/** 007 - CP Classes（★3）
 * 二分探索法
 */

fun main() {
  val N = readLine()!!.toInt()
  val A = readLine()!!.split(" ").map(String::toInt).sorted()
  val Q = readLine()!!.toInt()
  val B = List(Q) { readLine()!!.toInt() }

  val ans = mutableListOf<Int>()
  for (b in B) {
    val idx = A.binarySearch(b).let { if (it >= 0) it else it.inv() }
    var min = 1000_000_000
    if (idx < N) min = Math.min(min, Math.abs(A[idx] - b))
    if (idx > 0) min = Math.min(min, Math.abs(A[idx - 1] - b))
    ans.add(min)
  }

  ans.forEach(::println)
}
