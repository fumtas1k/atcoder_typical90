/**
 * 003 - Longest Circular Road（★4）
 * 木の直径
 * dfs
 */

fun solve() {
  val N = readLine()!!.toInt()
  val G = MutableList(N + 1) { mutableListOf<Int>() }
  repeat(N - 1) {
    val (a, b) = readLine()!!.split(" ").map(String::toInt)
    G[a].add(b)
    G[b].add(a)
  }

  var dists = MutableList(N + 1) { -1 }

  fun dfs(pos: Int) {
    G[pos].forEach {
      if (dists[it] >= 0) return@forEach
      dists[it] = dists[pos] + 1
      dfs(it)
    }
  }

  dists[1] = 0
  // dfsを用いて、頂点1からの最短距離をdistsに記録し、最短距離の最大となる頂点を特定する
  dfs(1)

  val maxIdx = (1 .. N).maxBy { dists[it] }!!

  dists.fill(-1)
  dists[maxIdx] = 0
  // 頂点max_idから、最短距離の最大値（木の直径）を求める
  dfs(maxIdx)
  println(dists.max()!! + 1)
}

fun main() {
  Thread(null, ::solve, "solve", 1.shl(26)).start()
}
