/**
 * 007 - CP Classes（★3）
 * 二分探索法
 */

fun main() {
  val N = readLine()!!.toInt()
  val A = readLine()!!.split(" ").map(String::toInt).sorted()
  val Q = readLine()!!.toInt()
  val B = List(Q) { readLine()!!.toInt() }

  B.forEach {
    val idx = A.lowerBound(it)
    var discontent = 1_000_000_000
    if (idx > 0) discontent = Math.min(discontent, Math.abs(it - A[idx - 1]))
    if (idx < N) discontent = Math.min(discontent, Math.abs(it - A[idx]))
    println(discontent)
  }
}

/**
 * LowerBound
 *
 * @param element 検索したい値
 * @param fromIndex 開始位置
 * @param toIndex 終了位置(この位置は含まない)
 * @return element以上の値が出現する一番左のインデックス
 */
fun <T: Comparable<T>> List<T>.lowerBound(element: T, fromIndex: Int = 0, toIndex: Int = size): Int {
  return binarySearch(element, Comparator {a, b -> if (a.compareTo(b) >= 0) 1 else -1 }, fromIndex, toIndex).inv()
}
