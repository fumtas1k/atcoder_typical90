# 050 - Stair Jump
# DP法

MOD = 10 ** 9 + 7
N, L = gets.split.map(&:to_i)

dp = [0] * (N + 1)
dp[0] = 1

(1..N).each do |i|
  dp[i] += dp[i - 1]
  dp[i] += dp[i - L] if i >= L
  dp[i] %= MOD
end

puts dp[N]
