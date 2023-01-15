/**
 * 026 - Independent Set on a Tree（★4）
 * 二部グラフ　再帰関数
 */

fun solve() {
  val N = readLine()!!.toInt()
  val G = MutableList(N) { mutableListOf<Int>() }
  for (i in 0 until N - 1) {
    val (a, b) = readLine()!!.split(" ").map { it.toInt() - 1 }
    G[a].add(b)
    G[b].add(a)
  }

  val colors = MutableList<Int>(N) { -1 }
  fun dfs(pos: Int, col: Int) {
    colors[pos] = col
    for (i in G[pos]) {
      if (colors[i] != -1) continue
      dfs(i, 1 - col)
    }
  }
  dfs(0, 0)

  val red = if (colors.sum() >= N / 2) 1 else 0
  val ans = colors.mapIndexed {i, c -> if(c == red) i + 1 else null}.filterNotNull().take(N / 2)
  println(ans.joinToString(" "))
}

fun main() {
  Thread(null, ::solve, "solve", 1.shl(26)).start()
}
