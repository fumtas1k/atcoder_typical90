# 019 - Pick Two（★6）
# 区間DP

N = gets.to_i
A = gets.split.map(&:to_i)
dp = Array.new(2 * N) { [10 ** 18] * (2 * N) }

# 初期化
(2 * N).times do |i|
  dp[i][i] = 0
  dp[i][i + 1] = (A[i] - A[i + 1]).abs if i + 1 < 2 * N
end

# 2つずつ消していくので区間は偶数
3.step(2 * N - 1, 2) do |i|
  (0...(2 * N - i)).each do |j|
    cl, cr = j, j + i
    dp[cl][cr] = [dp[cl][cr], dp[cl + 1][cr - 1] + (A[cl] - A[cr]).abs].min
    (cl..(cr - 1)).each do |k|
      dp[cl][cr] = [dp[cl][cr], dp[cl][k] + dp[k + 1][cr]].min
    end
  end
end

puts dp[0][-1]
