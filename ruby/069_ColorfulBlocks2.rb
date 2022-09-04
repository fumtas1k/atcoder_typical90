# 069 - Colorful Blocks 2（★3）
# 繰り返し2乗法

MOD = 10 ** 9 + 7
N, K = gets.split.map(&:to_i)

ans =
  if N == 1
    K
  elsif N == 2
    K * (K - 1) % MOD
  elsif K == 1
    0
  else
    K * (K - 1) * (K - 2).pow(N - 2, MOD) % MOD
  end

puts ans
