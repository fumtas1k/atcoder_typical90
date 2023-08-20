/**
 * 010 - Score Sum Queries（★2）
 * 累積和
 */

import java.io.PrintWriter

fun main() {

  val N = readLine()!!.toInt()
  val A = IntArray(N + 1) { 0 }
  val B = IntArray(N + 1) { 0 }
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
  val LR = Array(Q) { readLine()!!.split(" ").map(String::toInt) }

  val pw = PrintWriter(System.out, false)

  LR.forEach { (l, r) ->
    val ans = listOf(A[r] - A[l - 1], B[r] - B[l - 1])
    pw.println(ans.joinToString(" "))
  }
  pw.flush()
  pw.close()
}
