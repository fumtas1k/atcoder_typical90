/**
 * 061 - Deck（★2）
 * deque
 */

 fun main() {
  val Q = readLine()!!.toInt()
  val TX = Array(Q) { readLine()!!.split(" ").map(String::toInt) }
  val deque = mutableListOf<Int>()
  val ans = mutableListOf<Int>()

  TX.forEach {(t, x) ->
    when (t) {
      1 -> deque.add(0, x)
      2 -> deque.add(x)
      3 -> ans.add(deque[x - 1])
    }
  }

  ans.forEach(::println)
}
