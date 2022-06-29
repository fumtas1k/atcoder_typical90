# 064 - Uplift（★3）
# 階差

N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
LRV = Array.new(Q) { gets.split.map(&:to_i) }
# 最初の階差を計算
diffs = (1...N).map { A[_1] - A[_1 - 1] }
# 最初の不便さを計算
inconvenience = diffs.sum(&:abs)

ans = []
LRV.each do |l, r, v|
  l, r = l - 1, r - 1
  # 影響を受けるのは境界の階差のみ
  if l > 0
    pre_diff = diffs[l - 1]
    diffs[l - 1] += v
    inconvenience += diffs[l - 1].abs - pre_diff.abs
  end
  if r < N - 1
    pre_diff = diffs[r]
    diffs[r] -= v
    inconvenience += diffs[r].abs - pre_diff.abs
  end
  ans << inconvenience
end

puts ans
