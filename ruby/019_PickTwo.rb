# 019 - Pick Two（★6）
# 区間DP

N = gets.to_i
A = gets.split.map(&:to_i)
dp = Array.new(2 * N) { [Float::INFINITY] * (2 * N) }

# 初期化
(2 * N).times do |i|
  dp[i][i] = 0
  dp[i][i + 1] = (A[i] - A[i + 1]).abs if i + 1 < 2 * N
end

# 2つずつ消していくので区間は偶数
3.step(2 * N - 1, 2) do |dl|
  (2 * N - dl).times do |l|
    r = l + dl
    dp[l][r] = [dp[l][r], dp[l + 1][r - 1] + (A[l] - A[r]).abs].min
    (l ... r).each do |k|
      dp[l][r] = [dp[l][r], dp[l][k] + dp[k + 1][r]].min
    end
  end
end

puts dp[0][-1]
