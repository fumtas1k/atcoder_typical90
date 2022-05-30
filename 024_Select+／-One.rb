# 024 - Select +／- One
# パリティ

_, K = gets.split.map(&:to_i)
AB= Array.new(2) { gets.split.map(&:to_i) }.transpose
# AiとBiの差の絶対値の合計が一致させるための必要な最小操作回数
diff = AB.sum { (_1 - _2).abs }
# Kが最小操作回数以上かつ、Kと最小操作回数のパリティ（偶数/奇数）かの確認
puts diff <= K && diff[0] == K[0] ? "Yes" : "No"
