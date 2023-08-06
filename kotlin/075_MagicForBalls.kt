/**
 * 075 - Magic For Balls（★3）
 * 素因数分解
 */

fun main() {
  val N = readLine()!!.toLong()
  val divisionCnt = primeDivision(N).map { (_, v) -> v }.sum()
  var cnt = 0
  while (divisionCnt > 1.shl(cnt)) { cnt++ }
  println(cnt)
}

/**
 * 素因数分解
 *
 * @param num 素因数分解する数
 * @return MutableMap<素因数, 指数>
 */
fun primeDivision(num: Long): MutableMap<Long, Int> {
  val baseToExpMap = mutableMapOf<Long, Int>()
  var tmp = num
  (2 .. Math.sqrt(num.toDouble()).toLong()).forEach { i ->
    while (tmp % i == 0L) {
      baseToExpMap[i] = (baseToExpMap[i] ?: 0) + 1
      tmp /= i
    }
  }
  if (tmp > 1) baseToExpMap[tmp] = (baseToExpMap[tmp] ?: 0) + 1
  return baseToExpMap
}
