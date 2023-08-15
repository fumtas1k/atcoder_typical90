/**
 * 063 - Monochromatic Subgrid（★4）
 * bit全探索
 */

fun main() {
  val (H, W) = readLine()!!.split(" ").map(String::toInt)
  val P = Array(H) { readLine()!!.split(" ").map(String::toInt) }
  var ans = 0

  (1 until 1.shl(H)).forEach { bits ->
    val rows = mutableListOf<List<Int>>()
    repeat(H) { i ->
      if (bits.shr(i).and(1) == 0) return@repeat
      rows.add(P[i])
    }

    val cnt = mutableMapOf<Int, Int>().withDefault { 0 }
    repeat(W) column@ { j ->
      repeat(rows.size) { i -> if (rows[i][j] != rows[0][j]) return@column }
      cnt[rows[0][j]] = cnt.getValue(rows[0][j]) + 1
    }
    if (cnt.isEmpty()) return@forEach
    ans = maxOf(ans, cnt.values.max()!! * rows.size)
  }
  println(ans)
}
