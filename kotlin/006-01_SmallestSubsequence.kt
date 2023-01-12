/**
 * 006 - Smallest Subsequence（★5）
 * 貪欲法, 辞書順最小
 */

fun main() {
  val (N, K) = readLine()!!.split(" ").map(String::toInt)
  val S = readLine()!!.toList()
  val alphabet = MutableList(N + 1) { MutableList(26) { N } }
  for (i in N - 1 downTo 0) {
    for (j in alphabet[i].indices) alphabet[i][j] = alphabet[i + 1][j]
    alphabet[i][S[i].toInt() - 'a'.toInt()] = i
  }
  val ans = StringBuilder("")
  var i = 0
  for (k in K downTo 1) {
    for (j in alphabet[i].indices) {
      if (N - alphabet[i][j] < k) continue
      ans.append('a' + j)
      i = alphabet[i][j] + 1
      break
    }
  }
  println(ans)
}
