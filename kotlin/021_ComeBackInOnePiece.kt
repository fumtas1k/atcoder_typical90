/*
 * 021 - Come Back in One Piece（★5）
 * 強連結成分分解
 */

// 再帰関数をそのまま実行するとスタックオーバーフローしREとなる。
// それを回避するためThreadとして実行する必要があり、メイン処理をメソッド定義
fun solve() {
  val (N, M) = readLine()!!.split(" ").map(String::toInt)
  val GOTO = MutableList(N + 1) { mutableListOf<Int>() }
  val BACKTO = MutableList(N + 1) { mutableListOf<Int>() }

  for (i in 1 .. M) {
    val (a, b) = readLine()!!.split(" ").map(String::toInt)
    GOTO[a].add(b)
    BACKTO[b].add(a)
  }

  var used = MutableList(N + 1) { false }
  var log = mutableListOf<Int>()
  fun dfs1(pos: Int) {
    if (used[pos]) return
    used[pos] = true
    GOTO[pos].forEach(::dfs1)
    log.add(pos)
  }

  (1 .. N).forEach(::dfs1)

  used = MutableList(N + 1) { false }
  fun dfs2(pos: Int): Long {
    if (used[pos]) return 0
    used[pos] = true
    var cnt = 1L
    BACKTO[pos].forEach { cnt += dfs2(it) }
    return cnt
  }

  val ans = log.reversed().fold(0L) {acc, i ->
    val cnt = dfs2(i)
    acc + cnt * (cnt - 1) / 2
  }
  println(ans)
}

fun main() {
  Thread(null,::solve, "solve", 1.shl(26)).start()
}
