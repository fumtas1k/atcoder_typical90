/**
 * 012 - Red Painting（★4）
 * Union-Find
 */

/**
 * 012 - Red Painting（★4）
 * Union-Find
 */

import java.io.PrintWriter

class UnionFind(val size: Int) {
  val parents = IntArray(size) { it }

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
  val QUERY = Array(Q) { readLine()!!.split(" ").map(String::toInt) }

  val red = Array(H) { BooleanArray(W) { false } }
  val uf = UnionFind(H * W)

  val pw = PrintWriter(System.out, false)

  QUERY.forEach { q ->
    when (q[0]) {
      1 -> {
        val (r, c) = q.subList(1, 3).map { it - 1 }
        red[r][c] = true
        DIRECT.forEach direct@ { (dr, dc) ->
          val nr = r + dr
          val nc = c + dc
          if (nr !in 0 until H || nc !in 0 until W || !red[nr][nc]) return@direct
          uf.unite(r * W + c, nr * W + nc)
        }
      }
      2 -> {
        val (ra, ca, rb, cb) = q.subList(1, 5).map { it - 1 }
        var ans = "No"
        if (red[ra][ca] && red[rb][cb] && uf.isSame(ra * W + ca, rb * W + cb)) ans = "Yes"
        pw.println(ans)
      }
    }
  }
  pw.flush()
  pw.close()
}
