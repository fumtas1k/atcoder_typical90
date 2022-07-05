# 074 - ABC String 2（★6）
# 特殊ケースを考える, 不変量を考える

N = gets.to_i
S = gets.chomp.chars
d = {"a" => 0, "b" => 1, "c" => 2}

ans = N.times.reduce(0) {|sum, i| sum + d[S[i]] * (1 << i) }

puts ans
