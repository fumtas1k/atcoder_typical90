/**
 * 013 - Passing (★5)
 *  ダイクストラ法
 */

import java.io.PrintWriter
import java.util.PriorityQueue

fun main() {
  val (N, M) = readLine()!!.split(" ").map(String::toInt)
  val G = Array(N) { mutableListOf<Pair<Int, Int>>() }
  repeat(M) {
    val(a, b, c) = readLine()!!.split(" ").map(String::toInt)
    G[a - 1].add(Pair(b - 1, c))
    G[b - 1].add(Pair(a - 1, c))
  }

  fun dijkstra(start: Int): LongArray {
    val cost = LongArray(N) { 100_000L * 10_000 }
    cost[start] = 0L
    val log = PriorityQueue(sortedSetOf(compareBy {it.second}, Pair(start, 0L)))

    while (log.isNotEmpty()) {
      val (from, fromC) = log.poll()
      if (cost[from] < fromC) continue

      G[from].forEach { (to, toC) ->
        if (cost[to] < cost[from] + toC) return@forEach
        cost[to] = cost[from] + toC
        log.add(Pair(to, cost[to]))
      }
    }
    return cost
  }

  val oneToN = dijkstra(0)
  val nToOne = dijkstra(N - 1)
  val pw = PrintWriter(System.out, false)
  repeat(N) { pw.println(oneToN[it] + nToOne[it]) }
  pw.flush()
  pw.close()
}
