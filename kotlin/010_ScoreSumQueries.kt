/**
 * 010 - Score Sum Queries（★2）
 * 累積和
 */

fun main() {

  val N = readLine()!!.toInt()
  val A = MutableList<Int>(N + 1) { 0 }
  val B = MutableList<Int>(N + 1) { 0 }
  repeat(N) {
    val (c, p) = readLine()!!.split(" ").map(String::toInt)
    A[it + 1] = A[it]
    B[it + 1] = B[it]
    when (c) {
      1 -> A[it + 1] += p
      2 -> B[it + 1] += p
    }
  }

  val Q = readLine()!!.toInt()
  repeat(Q) {
    val (l, r) = readLine()!!.split(" ").map(String::toInt)
    val ans = listOf(A[r] - A[l - 1], B[r] - B[l - 1])
    println(ans.joinToString(" "))
  }
}
