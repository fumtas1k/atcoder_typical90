# 015 - Don't be too close（★6）
# 調和級数, 逆元, フェルマーの小定理

MOD = 10 ** 9 + 7

N = gets.to_i

def modpow(a, b, m)
  p, q = 1, a
  while b != 0
    if b & 1 == 1
      p *= q
      p %= m
    end
    q *= q
    q %= m
    b /= 2
  end
  p
end

# フェルマーの小定理
def div(a, b, m)
  (a * modpow(b, m - 2, m)) % m
  # (a * b.pow(m - 2, m)) % m
end

@fact = (1..N).reduce([1]) {|mul, i| (mul << mul[-1] * i % MOD) }

@factinv = []
(0..N).each do |i|
  @factinv[i] = div(1, @fact[i], MOD)
end

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
