/**
 * 021 - Come Back in One Piece（★5）
 * 強連結成分分解
 */

class SCC(val size: Int) {

  val edges = Array(size) { mutableListOf<Int>() }

  fun addEdge(from: Int, to: Int) {
    edges[from].add(to)
  }

  fun addEdges(pairs: List<Pair<Int, Int>>) {
    pairs.forEach { (from, to) -> addEdge(from, to) }
  }

  fun scc(): List<List<Int>> {
    val (groupNum, ids) = decompose()
    val groups = MutableList(groupNum) { mutableListOf<Int>() }
    ids.forEachIndexed { i, id -> groups[id].add(i) }
    return groups
  }

  private fun decompose(): Pair<Int, List<Int>> {
    var curOrd = 0
    var groupNum = 0
    val visited = mutableListOf<Int>()
    val low = IntArray(size) { -1 }
    val ord = IntArray(size) { -1 }
    val ids = IntArray(size)

    val dfs = DeepRecursiveFunction<Int, Unit> { from ->
      low[from] = curOrd
      ord[from] = curOrd
      curOrd++
      visited.add(from)
      edges[from].forEach { to ->
        if (ord[to] != -1) {
          low[from] = Math.min(low[from], ord[to])
        } else {
          callRecursive(to)
          low[from] = Math.min(low[from], low[to])
        }
      }

      if (low[from] != ord[from]) return@DeepRecursiveFunction

      while (visited.isNotEmpty()) {
        val to = visited.removeLast()
        ord[to] = size
        ids[to] = groupNum
        if (to == from) break
      }
      groupNum++
    }

    for (to in 0 until size) { if (ord[to] == -1) dfs(to) }

    return groupNum to ids.map { groupNum - it - 1 }
  }
}

fun main() {
  val (N, M) = readLine()!!.split(" ").map(String::toInt)
  val scc = SCC(N)
  repeat(M) {
    val (a, b) = readLine()!!.split(" ").map(String::toInt).map(Int::dec)
    scc.addEdge(a, b)
  }
  val ans = scc.scc().sumOf { it.size.toLong() * (it.size - 1) / 2 }
  println(ans)
}
