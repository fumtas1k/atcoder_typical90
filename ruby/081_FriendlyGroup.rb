# 081 - Friendly Group（★5）
# 二次元累積和, 二次元imos法

MAX = 5000
N, K = gets.split.map(&:to_i)
imos = Array.new(MAX) { Array.new(MAX, 0) }
row_max = col_max = 0

# 二次元座標上で[a, b]は[a, b]から[a + K, b + K]の範囲の点とチームを組むことが可能
N.times do
  a, b = gets.split.map(&:to_i).map(&:pred)
  row_max = a if row_max < a
  col_max = b if col_max < b
  imos[a][b] += 1
  imos[a][b + K + 1] -= 1 if b + K + 1 < MAX
  imos[a + K + 1][b] -= 1 if a + K + 1 < MAX
  imos[a + K + 1][b + K + 1] += 1 if a + K + 1 < MAX && b + K + 1 < MAX
end

# imosで累積和をとっているとTLEするので、都度計算する
ans = 0
cols = Array.new(MAX, 0)
(row_max + 1).times do |i|
  rows = 0
  (col_max + 1).times do |j|
    rows += imos[i][j]
    cols[j] += rows
  end
  max = cols.max
  ans = max if ans < max
end

puts ans
