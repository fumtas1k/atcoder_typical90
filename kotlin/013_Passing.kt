/**
 * 013 - Passing (★5)
 *  ダイクストラ法
 */

import java.util.PriorityQueue

fun readInts() = readLine()!!.split(" ").map(String::toInt)

fun main() {
  val (N, M) = readInts()
  val G = MutableList(N) { mutableListOf<Pair<Int, Int>>() }
  repeat(M) {
    val(a, b, c) = readInts()
    G[a - 1].add(Pair(b - 1, c))
    G[b - 1].add(Pair(a - 1, c))
  }

  fun dijkstra(start: Int): MutableList<Int> {
    val cost = MutableList(N) { 1_000_000_000 }
    cost[start] = 0
    val log = PriorityQueue<Pair<Int, Int>> {a, b -> a.second - b.second }
    log.add(Pair(start, 0))

    while (log.isNotEmpty()) {
      val (from, fromC) = log.poll()
      if (cost[from] < fromC) continue

      for ((to, toC) in G[from]) {
        if (cost[to] < cost[from] + toC) continue
        cost[to] = cost[from] + toC
        log.add(Pair(to, cost[to]))
      }
    }
    return cost
  }

  val oneToN = dijkstra(0)
  val nToOne = dijkstra(N - 1)
  val ans = MutableList(N) { 0 }
  for (i in 0 until N) ans[i] = oneToN[i] + nToOne[i]

  ans.forEach(::println)
}
