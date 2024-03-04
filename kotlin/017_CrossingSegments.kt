/**
 * 017 - Crossing Segments（★7）
 * 余事象
 * BIT(FenwickTree)
 */

class FenwickTree private constructor(
  private val data: LongArray,
  private val size: Int
)  {
  companion object {
    fun of(size: Int) = FenwickTree(LongArray(size + 1) {0}, size)
    fun of(list: List<Long>) = FenwickTree(longArrayOf(0) + list.toLongArray(), list.size)
  }

  fun add(pos: Int, value: Long) {
    var idx = pos + 1
    while (idx <= size) {
      data[idx] = data[idx] + value
      idx += idx.and(-idx)
    }
  }

  fun sum(l: Int, r: Int): Long {
    return _sum(r) - _sum(l)
  }

  fun _sum(r: Int): Long {
    var idx = r
    var res = 0L
    while (idx > 0) {
      res += data[idx]
      idx -= idx.and(-idx)
    }
    return res
  }
}


fun main() {
  val (N, M) = readLine()!!.split(" ").map(String::toInt)
  val LR = mutableListOf<Pair<Int, Int>>()
  val COUNT = LongArray(N) { 0 }
  val R = LongArray(N) { 0 }
  repeat(M) {
    val (l, r) = readLine()!!.split(" ").map(String::toInt).map(Int::dec)
    LR.add(Pair(l, r))
    COUNT[l]++
    COUNT[r]++
    R[r]++
  }

  val total = M.toLong() * (M - 1) / 2

  // ① 点を共有
  val comp1 = COUNT.sumOf { it * (it - 1) / 2 }

  // ② Rs < Lt
  val rcsum = R.scan(0, Long::plus)
  val comp2 = LR.sumOf { (l, _) -> rcsum[l] }

  // ③ 内包
  val L = FenwickTree.of(N)
  var comp3 = 0L
  LR.sortedWith(compareBy({ it.second }, { it.first })).forEach { (l, r) ->
    comp3 += L.sum(l + 1, r)
    L.add(l, 1)
  }

  println(total - comp1 - comp2 - comp3)
}
