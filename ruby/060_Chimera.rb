# 060 - Chimera（★5）
# 最長増加部分列(LIS), 二分探索

N = gets.to_i
A = gets.split.map(&:to_i)

# 返す配列のi番目はi番目の値を最大とするLISの長さ
# dpは短調増加だが、返す配列は短調増加ではない。
# arr自体の最長増加部分列の長さはdpのsize or 返り値の最大値で求まる
def lis(arr)
  n = arr.size
  dp = []
  arr.reduce([]) do |result, a|
    pos = dp.bsearch_index { _1 >= a } || dp.size
    dp[pos] = a
    result << pos + 1
  end
end

P = lis(A)
Q = lis(A.reverse)
puts N.times.map { P[_1] + Q[N - _1 - 1] - 1 }.max
