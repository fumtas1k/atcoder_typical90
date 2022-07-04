# 073 - We Need Both a and b（★5）
# 木DP

MOD = 10 ** 9 + 7

N = gets.to_i
C = gets.chomp.split
G = Array.new(N) { [] }
(N - 1).times do |i|
  a, b = gets.split.map { _1.to_i - 1 }
  G[a] << b
  G[b] << a
end

# @dp[u][c]
# 頂点uを根とする部分木. 頂点uを含む連結成分の状態がjの時の場合の数
# cは0〜2. 0:aしかない, 1:bしかない, 2:a, b両方ある
@dp = Array.new(N) { [0] * 3 }
def dfs(pos, pre)
  ab = { "a" => 0, "b" => 1 }
  c = ab[C[pos]]
  valc = val2 = 1
  G[pos].each do |i|
    next if i == pre
    dfs(i, pos)
    # 例:　子がcのみのものを切断しない or 子がab両方含むパターンを切断する
    valc *= (@dp[i][c] + @dp[i][2])
    valc %= MOD
    # ab両方: 切断しなければ、子はなんでも良い（全パターン）。切断する場合は、子がab両方含むパターン
    # 但し、cのみパターンは除外する必要があるため後で引く。
    val2 *= (@dp[i][0] + @dp[i][1] + 2 * @dp[i][2])
    val2 %= MOD
  end
  @dp[pos][c] = valc
  @dp[pos][2] = (val2 - valc) % MOD
end

dfs(0, -1)
puts @dp[0][2]
