/**
 * 015 - Don't be too close（★6）
 * 調和級数
 * 逆元
 * フェルマーの小定理
 */

fun main() {
  val MOD = 1_000_000_007L
  val N = readLine()!!.toInt()

  val fact = MutableList(N + 1) { 1L }
  (1 .. N).forEach { fact[it] = fact[it - 1] * it % MOD }

  val factInv = (0 .. N).map { div(1L, fact[it], MOD) }

  fun nCr(n: Int, r: Int): Long {
    if (n < r || r < 0) return 0
    return (fact[n] * factInv[r] % MOD) * factInv[n - r] % MOD
  }

  for (k in 1 .. N) {
    var ans = 0L
    for (r in 1 .. (N / k + 1)) {
      val n = N - (k - 1) * (r - 1)
      if (n < 0) break
      ans += nCr(n, r)
      ans %= MOD
    }
    println(ans)
  }
}

fun modPow(a: Long, b: Long, mod: Long): Long {
  var ans = 1L
  var exp = b
  var mul = a
  while (exp > 0L) {
    if (exp % 2 == 1L) {
      ans *= mul
      ans %= mod
    }
    mul *= mul
    mul %= mod
    exp /= 2
  }
  return ans
}

fun div(mol: Long, deno: Long, mod: Long): Long = mol * modPow(deno, mod - 2L, mod) % mod
