# 089
# 条件の言い換え, 不変量, 尺取法, BIT, 座標圧縮, 累積和, 動的計画法

require "ac-library-rb/fenwick_tree"

M = 10 ** 9 + 7
N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).map(&:pred)
indexes = A.sort.uniq.map.with_index.to_h

# 区間[l, r]の転倒数が K 以下となる最小のlの値 cl[r]　を求める
cl = Array.new(N, 0)
ft = AcLibraryRb::FenwickTree.new(indexes.size)

l = N
cnt = 0
(N - 1).downto(0) do |r|
  while l >= 1 && cnt + ft.sum(indexes[A[l - 1]]) <= K
    l -= 1
    cnt += ft.sum(indexes[A[l]])
    ft.add(indexes[A[l]], 1)
  end
  cl[r] = l

  ft.add(indexes[A[r]], -1)
  cnt -= ft.sum(indexes[A[r]] + 1, indexes.size)
end

dp = Array.new(N + 1, 0)
csum = Array.new(N + 1, 0)
dp[0] = csum[0] = 1

N.times do |i|
  if cl[i].zero?
    dp[i + 1] = csum[i]
  else
    dp[i + 1] = (csum[i] - csum[cl[i] - 1] + M) % M
  end
  csum[i + 1] = (csum[i] + dp[i + 1]) % M
end

puts dp[-1]
