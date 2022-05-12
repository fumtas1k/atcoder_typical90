# 008 - AtCounter（★4）
# 状態DP法

N = gets.to_i
S = gets.chomp
T = "atcoder"
MOD = 10 ** 9 + 7

# dp[Sの文字の位置(1~N)][Tの文字の位置(1~T.size)]
# dp[i][0] = 1 なのは、""を表す方法が1通りのみだから(どれも使用しない)
dp = Array.new(N + 1){[1] + [0] * T.size }

N.times do |i|
  T.size.times do |j|
    dp[i + 1][j + 1] += dp[i][j + 1] # T[j]を使わないパターン
    dp[i + 1][j + 1] += dp[i][j] if S[i] == T[j] # T[j]を使うパターン
    dp[i + 1][j + 1] %= MOD
  end
end

puts dp[-1][-1]
