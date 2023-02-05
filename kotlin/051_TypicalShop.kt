/**
 * 051 - Typical Shop（★5）
 * 半分全列挙
 */

fun main() {
  val (N, K, P) = readLine()!!.split(" ").let {(n, k, p) -> Triple(n.toInt(), k.toInt(), p.toLong()) }
  val A = readLine()!!.split(" ").map(String::toLong)
  val mid = N / 2
  val B = A.subList(0, mid)
  val C = A.subList(mid, N)

  val bKP = getKP(B)
  val cKP = getKP(C)

  var ans = 0L
  for (k1 in 0 .. Math.min(mid, K)) {
    val k2 = K - k1
    if (k2 > N - mid) continue
    for (bP in bKP[k1]) {
      ans += cKP[k2].binarySearch(P - bP + 1).let { if (it < 0) it.inv() else it }.toLong()
    }
  }

  println(ans)
}

fun getKP(list: List<Long>): MutableList<MutableList<Long>> {
  val size = list.size
  val result = MutableList(size + 1) { mutableListOf<Long>() }

  for (i in 0 until 1.shl(size)) {
    var price = 0L
    var count = 0
    for (j in 0 until size) {
      if (i.shr(j) and 1 == 0) continue
      price += list[j]
      count++
    }
    result[count].add(price)
  }
  result.forEach { it.sort() }
  return result
}
