# 070 - Plant Planning（★4）
# マンハッタン距離, 独立で考える

N = gets.to_i
X, Y = Array.new(N) { gets.split.map(&:to_i) }.transpose

mid_x = X.sort[N / 2]
mid_y = Y.sort[N / 2]

ans = N.times.reduce(0) do |sum, i|
  sum + (mid_x - X[i]).abs + (mid_y - Y[i]).abs
end

puts ans
