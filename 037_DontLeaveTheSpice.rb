# 037 - Don't Leave the Spice（★5）
# スライド最大値(最小値), DP法, 動的計画法
# セグメント木ではTLEする

W, N = gets.split.map(&:to_i)
LRV = Array.new(N) { gets.split.map(&:to_i) }
dp = Array.new(N + 1) { [-1] * (W + 1) }
dp[0][0] = 0

LRV.each_with_index do |(l, r, v), i|
  # スライド最大値を使用して区間の最大値を求める
  deque = []
  first = true
  (W + 1).times do |j|
    dp[i + 1][j] = dp[i][j]
    next if j < l
    cl = [0, j - r].max
    cr = [0, j - l].max

    if first
      deque = [*cl..cr].sort_by { - dp[i][_1] }
      first = false
    end

    while !deque.empty? && dp[i][deque[-1]] <= dp[i][cr]
      deque.pop
    end

    while !deque.empty? && deque[0] < cl
      deque.shift
    end

    deque << cr
    val = dp[i][deque[0]]
    next if val == -1
    dp[i + 1][j] = [dp[i + 1][j], val + v].max
  end
end

puts dp[N][W]
