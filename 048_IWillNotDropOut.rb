# 048 - I will not drop out（★3）
# 上界(下界)の見積り

N, K = gets.split.map(&:to_i)
A, B = Array.new(N) { gets.split.map(&:to_i) }.transpose
# 部分点の残り点数
C = A.zip(B).map { _1 - _2 }
# 1分で取れる点数を降順にする.
D = [*B, *C].sort.reverse
# Bi > CiのためCiを選択する時は必ずBiも選択されている
puts D[0, K].sum
