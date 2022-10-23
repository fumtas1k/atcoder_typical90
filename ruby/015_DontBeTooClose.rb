# 015 - Don't be too close（★6）
# 調和級数, 逆元, フェルマーの小定理

MOD = 10 ** 9 + 7

N = gets.to_i

def modpow(a, b, mod)
  result, mul, exp = 1, a, b
  while exp > 0
    if exp & 1 == 1
      result *= mul
      result %= mod
    end
    mul *= mul
    mul %= mod
    exp /= 2
  end
  result
end

# フェルマーの小定理
def div(a, b, m)
  (a * modpow(b, m - 2, m)) % m
  # (a * b.pow(m - 2, m)) % m
end

@fact = (1..N).reduce([1]) {|mul, i| (mul << mul[-1] * i % MOD) }

@factinv = (0..N).map { div(1, @fact[_1], MOD) }

def ncr(n, r)
  return 0 if n < r || r < 0
  (@fact[n] * @factinv[r] % MOD) * @factinv[n - r] % MOD
end

def query(k)
  ret = 0
  (1..(N / k + 1)).each do |i|
    n = N - (k - 1) * (i - 1)
    break if n < 0
    ret += ncr(n, i)
    ret %= MOD
  end
  ret
end

(1..N).each do |k|
  puts query(k)
end
