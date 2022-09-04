# 056 - Lucky Bag（★5）
# 動的計画法, DP法, DP復元

N, S = gets.split.map(&:to_i)
AB = Array.new(N) { gets.split.map(&:to_i) }
dp = Array.new(N + 1) { [false] * (S + 1) }
dp[0][0] = true

N.times do |i|
  (S + 1).times do |j|
    AB[i].each do |x|
      next if j < x
      dp[i + 1][j] = true if dp[i][j - x]
    end
  end
end

if !dp[N][S]
  puts "Impossible"
else
  ans = []
  pos = S
  (N - 1).downto(0) do |i|
    a, b = AB[i]
    if pos >= a && dp[i][pos - a]
      ans[i] = "A"
      pos -= a
    else
      ans[i] = "B"
      pos -= b
    end
  end
  puts ans.join
end
