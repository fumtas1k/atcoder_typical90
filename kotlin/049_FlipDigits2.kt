/**
 * 049 - Flip Digits 2（★6）
 * 最小全域木, Union-Find, クラスカル法
*/
class UnionFind(private val size: Int) {
  private var parents: MutableList<Int>
  init {
    parents = MutableList(size) { it }
  }

  fun root(u: Int): Int {
    if(u == parents[u]) return u
    parents[u] = root(parents[u])
    return parents[u]
  }

  fun unite(u: Int, v: Int) {
    val ru = root(u)
    val rv = root(v)
    if (ru == rv) return
    parents[rv] = ru
  }

  fun isSame(u: Int, v: Int): Boolean {
    return root(u) == root(v)
  }
}


fun main() {
  val (N, M) = readLine()!!.split(" ").map(String::toInt)
  // クラスカル法を用いるため価格でsortする
  val CLR = MutableList(M) { readLine()!!.split(" ").map(String::toLong) }
  CLR.sortBy { it[0] }

  var cost = 0L
  var cnt = 0
  var ans = -1L
  // N+1頂点のグラフが連結できるかを考える
  val uf = UnionFind(N + 1)

  // Union-Findとクラスカル法で最小全域木を求める
  for ((c, l, r) in CLR) {
    val li = l.toInt()
    val ri = r.toInt()
    if (uf.isSame(li - 1, ri)) continue
    uf.unite(li - 1, ri)
    cost += c
    cnt++
    if (cnt == N) {
      ans = cost
      break
    }
  }

  println(ans)
}
