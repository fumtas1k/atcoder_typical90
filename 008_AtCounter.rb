# 008 - AtCounter（★4）
# 状態DP法

MOD = 10 ** 9 + 7

N = gets.to_i
S = gets.chomp.chars
T = "atcoder".chars

# dp[Sの文字の位置(1~N)][Tの文字の位置(1~T.size)]
dp = Array.new(N + 1) { [0] * (T.size + 1) }
# dp[0][0] = 1 なのは、""を表す方法が1通りのみだから(どれも使用しない)
dp[0][0] = 1

N.times do |i|
  (T.size + 1).times do |j|
    dp[i + 1][j] += dp[i][j] # S[i]を使わないパターン
    dp[i + 1][j + 1] += dp[i][j] if j < N && S[i] == T[j] # S[i]を使うパターン
    dp[i + 1][j] %= MOD
  end
end

puts dp[-1][-1]
