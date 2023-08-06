/**
 * 002 - Encyclopedia of Parentheses（★3）
 * bit全探索
 * 正しい括弧列の条件
 */

fun main() {
  val N = readLine()!!.toInt()

  if (N % 2 == 1) return println("")

  val ans = mutableListOf<String>()
  repeat(1.shl(N)) { bits ->
    val brackets = mutableListOf<Char>()
    repeat(N) { i ->
      brackets.add(if (bits.shr(i).and(1) == 1) '(' else ')')
    }
    if (!isBrackets(brackets)) return@repeat
    ans.add(brackets.joinToString(""))
  }
  ans.sorted().forEach(::println)
}

fun isBrackets(brackets: MutableList<Char>): Boolean {
  var cnt = 0
  brackets.forEach {
    cnt += if (it == '(') 1 else -1
    if (cnt < 0) return false
  }
  return cnt == 0
}
