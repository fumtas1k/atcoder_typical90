# 042 - Multiple of 9（★4）
# dp, 動的計画法

MOD = 10 ** 9 + 7
K = gets.to_i

dp = [0] * (K + 1)
dp[0] = 1

# 正の整数Xが9の倍数で各桁の和がKになることと、
# Kが9の倍数になることとが同義
if K % 9 == 0
  (1..K).each do |i|
    (1..9).each do |j|
      dp[i] += dp[i - j] if i >= j
      dp[i] %= MOD
    end
  end
end

puts dp[K]
