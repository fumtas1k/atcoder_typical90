# 018 - Statue of Chokudai（★3）
# 三角関数

T = gets.to_i
L, X, Y = gets.split.map(&:to_i)
Q = gets.to_i
E = Array.new(Q) { gets.to_i }

def angle(t)
  y = - Math.sin(2 * Math::PI * t / T) * L / 2
  z = (1 - Math.cos(2 * Math::PI * t / T)) * L / 2
  dist = Math.sqrt(X ** 2 + (Y - y) ** 2)
  # Math.atan2(y, x): y / x の逆正接関数の値を返す [- π, π]の範囲
  Math.atan2(z, dist) * 180 / Math::PI
end

puts E.map(&method(:angle))
