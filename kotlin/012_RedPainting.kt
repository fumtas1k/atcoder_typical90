/** 012 - Red Painting（★4）
 * Union-Find
 */

class UnionFind(val size: Int) {
  val parents = MutableList(size) { it }

  fun root(u: Int): Int {
    if (parents[u] == u) return u
    parents[u] = root(parents[u])
    return parents[u]
  }

  fun unite(u: Int, v: Int) {
    val ru = root(u)
    val rv = root(v)
    if (ru == rv) return
    parents[ru] = rv
  }

  fun isSame(u: Int, v: Int): Boolean {
    return root(u) == root(v)
  }
}

fun main() {
  val DIRECT = listOf(1 to 0, 0 to 1, -1 to 0, 0 to -1)

  val (H, W) = readLine()!!.split(" ").map(String::toInt)
  val Q = readLine()!!.toInt()
  val query = MutableList(Q) { readLine()!!.split(" ").map(String::toInt) }

  val red = MutableList(H) { MutableList(W) { false } }
  val uf = UnionFind(H * W)
  for (q in query) {
    when (q[0]) {
      1 -> {
        val (r, c) = q.subList(1, 3).map { it - 1 }
        red[r][c] = true
        for ((dr, dc) in DIRECT) {
          val nr = r + dr
          val nc = c + dc
          if (nr !in 0 until H || nc !in 0 until W || !red[nr][nc]) continue
          uf.unite(r * W + c, nr * W + nc)
        }
      }
      2 -> {
        val (ra, ca, rb, cb) = q.subList(1, 5).map { it - 1 }
        var ans = "No"
        if (red[ra][ca] && red[rb][cb] && uf.isSame(ra * W + ca, rb * W + cb)) ans = "Yes"
        println(ans)
      }
    }
  }
}
