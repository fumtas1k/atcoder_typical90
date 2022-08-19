# 037 - Don't Leave the Spice（★5）
# スライド最大値(最小値), DP法, 動的計画法
# セグメント木ではTLEする

W, N = gets.split.map(&:to_i)
LRV = Array.new(N) { gets.split.map(&:to_i) }
dp = Array.new(N + 1) { [-1] * (W + 1) }
dp[0][0] = 0

LRV.each_with_index do |(l, r, v), i|
  # スライド最大値を使用して区間の最大値を求める
  max_idxs = []
  first = true
  (W + 1).times do |j|
    dp[i + 1][j] = dp[i][j]
    next if j < l
    cl = [0, j - r].max
    cr = [0, j - l].max

    if first
      # max_idxsの左端がdp[i]のcl~cr区間最大値
      max_idxs = [*cl..cr].sort_by { - dp[i][_1] }
      first = false
    end

    # crがmax_idxsの右端(最小)になるよう設定
    while !max_idxs.empty? && dp[i][max_idxs[-1]] <= dp[i][cr]
      max_idxs.pop
    end

    # clよりindexが小さいものは候補とならないので取り除く
    while !max_idxs.empty? && max_idxs[0] < cl
      max_idxs.shift
    end

    max_idxs << cr
    val = dp[i][max_idxs[0]]
    next if val == -1
    dp[i + 1][j] = [dp[i + 1][j], val + v].max
  end
end

puts dp[N][W]
