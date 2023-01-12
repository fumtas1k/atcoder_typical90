/**
 * 034 - There are few types of elements（★4）
 * 尺取法
 */

fun main() {

  val (N, K) = readLine()!!.split(" ").map(String::toInt)
  val A = readLine()!!.split(" ").map(String::toInt)

  var ans = 0
  var cnt = 0
  var useCnt = mutableMapOf<Int, Int>().withDefault { 0 }
  var right = 0
  for (left in 0 until N) {
    while (right < N) {
      val a = A[right]
      if (useCnt.getValue(a) == 0) {
        if (cnt == K) break
        cnt++
      }
      useCnt.put(a, useCnt.getValue(a) + 1)
      right++
    }
    ans = Math.max(ans, right - left)
    useCnt.put(A[left], useCnt.getValue(A[left]) - 1)
    if (useCnt[A[left]] == 0) cnt--
  }

  println(ans)
}
