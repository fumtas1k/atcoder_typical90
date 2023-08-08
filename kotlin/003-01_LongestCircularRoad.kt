/**
 * 003 - Longest Circular Road（★4）
 * 木の直径
 * bfs
 */

// kotlin 1.3.7ではArrayDequeはまだ実験的導入だったため記述が必要
@kotlin.ExperimentalStdlibApi
fun main() {
  val N = readLine()!!.toInt()
  val G = MutableList(N + 1) { mutableListOf<Int>() }
  repeat(N - 1) {
    val (a, b) = readLine()!!.split(" ").map(String::toInt)
    G[a].add(b)
    G[b].add(a)
  }

  /**
   * bfs
   * @param start 開始位置
   * @return Pair<ゴール, 道路数>
   */
  fun bfs(start: Int): Pair<Int, Int> {
    val nextPos = ArrayDeque<Int>(listOf(start))
    val dists = MutableList(N + 1) { -1 }
    dists[start] = 0
    while (nextPos.isNotEmpty()) {
      val pos = nextPos.removeFirst()
      G[pos].forEach {
        if (dists[it] != -1) return@forEach
        dists[it] = dists[pos] + 1
        nextPos.add(it)
      }
    }

    val maxIdx = (0 .. N).maxBy { dists[it] }!!
    return Pair(maxIdx, dists[maxIdx])
  }

  val maxIdx = bfs(1).first
  println(bfs(maxIdx).second + 1)
}
