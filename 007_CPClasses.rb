# 007 - CP Classes（★3）
# 二分探索法

N = gets.to_i
A = gets.split.map(&:to_i).sort
Q = gets.to_i
B = Array.new(Q){ gets.to_i }

ans = B.reduce([]) do |arr, b|
  # bsearch_indexは二分探索で条件を満たす最小のインデックスを返すメソッド.
  # bがA[N-1]より大きい場合はnilが返るため、nilガードを用いる.
  idx = A.bsearch_index{ _1 >= b } || N - 1
  arr << [(A[idx] - b).abs, (A[idx - 1] - b).abs].min
end
puts ans
