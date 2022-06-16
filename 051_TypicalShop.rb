# 051 - Typical Shop（★5）
# 半分全列挙

N, K, P = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
mid = N / 2

# ans[i]はarrからi個選択した時の値段のありうる合計の配列
def get_kp(arr)
  n = arr.size
  ans = Array.new(n + 1) { [] }
  ans[0] << 0
  (1..n).each do |i|
    arr.combination(i) do |comb|
      ans[i] << comb.sum
    end
    ans[i].sort!
  end
  ans
end

prices1 = get_kp(A[0, mid])
prices2 = get_kp(A[mid..])

ans = 0
[mid + 1, K + 1].min.times do |k1|
  k2 = K - k1
  next unless k2.between?(0, N - mid)
  prices1[k1].each do |p1|
    ans += prices2[k2].bsearch_index { _1 + p1 > P } || prices2[k2].size
  end
end

puts ans
