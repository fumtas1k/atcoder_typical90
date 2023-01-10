/**
 * 014 - We Used to Sing a Song Together（★3）
 * 貪欲法
 * ソート
 */

fun main() {
  val N = readLine()!!.toInt()
  val A = readLine()!!.split(" ").map(String::toLong).sorted()
  val B = readLine()!!.split(" ").map(String::toLong).sorted()

  // sumByはLongが使えないので以下の方法で
  var ans = (0 until N).map { Math.abs(A[it] - B[it]) }.sum()
  println(ans)
}
