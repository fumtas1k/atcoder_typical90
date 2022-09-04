# 036 - Max Manhattan Distance（★5）
# マンハッタン距離

N, Q = gets.split.map(&:to_i)
XY = Array.new(N) { gets.split.map(&:to_i) }
QUERY = Array.new(Q) { gets.to_i - 1 }

# 45°回転することで、(x1,y1)と(x2,y2)間のマンハッタン距離が
# max(|x1 - x2|, |y1 - y2|)で表される
X, Y = [], []
XY.each do |x, y|
  X << x - y
  Y << x + y
end
x_end = X.minmax
y_end = Y.minmax

ans = QUERY.map do |i|
  x, y = X[i], Y[i]
  [*x_end.map { (x - _1).abs }, *y_end.map { (y - _1).abs }].max
end

puts ans
