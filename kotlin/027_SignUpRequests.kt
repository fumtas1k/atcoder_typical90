/*
 * 027 - Sign Up Requests （★2）
 * Map
 */

fun main() {
  val N = readLine()!!.toInt()
  val S = List(N) { readLine()!! }
  val map = mutableMapOf<String, Int>()

  S.forEachIndexed {i, s -> if (!map.containsKey(s)) map.put(s, i + 1) }
  map.map{it.value}.sorted().forEach(::println)
}
