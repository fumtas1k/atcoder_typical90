/**
 * 003 - Longest Circular Road（★4）
 * 木の直径
 * dfs
 */

fun solve() {
  val N = readLine()!!.toInt()
  val G = MutableList(N) { mutableListOf<Int>() }
  repeat(N - 1) {
    val (a, b) = readLine()!!.split(" ").map { it.toInt() - 1 }
    G[a].add(b)
    G[b].add(a)
  }

  var dists = MutableList(N) { 0 }

  fun dfs(pos: Int) {
    for(i in G[pos]) {
      if (dists[i] > 0) continue
      dists[i] = dists[pos] + 1
      dfs(i)
    }
  }

  dists[0] = 1
  // dfsを用いて、頂点0(1)からの最短距離をdistsに記録し、最短距離の最大となる頂点を特定する
  dfs(0)

  val maxIdx = (0 until N).maxBy { dists[it] }!!

  dists = MutableList<Int>(N) { 0 }
  dists[maxIdx] = 1
  // 頂点max_idから、最短距離の最大値（木の直径）を求める
  dfs(maxIdx)
  println(dists.max())
}

fun main() {
  Thread(null, ::solve, "solve", 1.shl(26)).start()
}
