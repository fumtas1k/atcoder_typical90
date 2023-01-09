/**
 * 002 - Encyclopedia of Parentheses（★3）
 * bit全探索
 * 正しい括弧列の条件
 */

fun main() {
  val N = readLine()!!.toInt()
  val brackets = mutableListOf<String>()

  if (N and 1 == 1) return
  for (i in 0 until 1.shl(N)) {
    val list = mutableListOf<String>()
    for (j in 0 until N) {
      list.add(if (i.shr(j) and 1 == 0) "(" else ")")
    }
    if (isBracket(list)) brackets.add(list.joinToString(""))
  }
  brackets.sorted().forEach(::println)
}

fun isBracket(brackets: MutableList<String>): Boolean {
  var cnt = 0
  for (b in brackets) {
    if (b == "(") cnt++
    else cnt--
    if (cnt < 0) break
  }
  return cnt == 0
}
