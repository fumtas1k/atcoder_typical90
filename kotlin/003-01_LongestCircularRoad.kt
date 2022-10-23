/**
 * 003 - Longest Circular Road（★4）
 * 木の直径
 * bfs
 */

// kotlin 1.3.7ではArrayDequeはまだ実験的導入だったため記述が必要
@kotlin.ExperimentalStdlibApi
fun main() {
  val N = readLine()!!.toInt()
  val G = MutableList(N) { mutableListOf<Int>() }
  repeat(N - 1) {
    val(a, b) = readLine()!!.split(" ").map { it.toInt() - 1 }
    G[a].add(b)
    G[b].add(a)
  }

  fun bfs(start: Int): Pair<Int, Int> {
    val distances = MutableList(N) { 0 }
    distances[start] = 1
    val nextPos = ArrayDeque<Int>(listOf(start))

    while (nextPos.isNotEmpty()) {
      val pos = nextPos.removeFirst()
      for (i in G[pos]) {
        if (distances[i] != 0) continue
        distances[i] = distances[pos] + 1
        nextPos.add(i)
      }
    }
    val maxDistance = distances.max()!!
    return Pair(distances.indexOf(maxDistance), maxDistance)
  }

  val (maxDistanceIdx, _) = bfs(0)
  println(bfs(maxDistanceIdx).second)
}
