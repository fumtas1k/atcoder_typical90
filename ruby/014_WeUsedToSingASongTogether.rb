# 014 - We Used to Sing a Song Together（★3）
# 貪欲法 ソート

gets
AB = Array.new(2) { gets.split.map(&:to_i).sort }
puts AB.transpose.sum { (_1 - _2).abs }
