# 010 - Score Sum Queries（★2）
# 累積和

N = gets.to_i
CP = Array.new(N) { gets.split.map(&:to_i) }
Q = gets.to_i
LR = Array.new(Q) { gets.split.map(&:to_i) }

one, two = [0], [0]
CP.each do |c, p|
  one << one[-1]
  two << two[-1]
  c == 1 ? (one[-1] += p) : (two[-1] += p)
end

LR.each do |l, r|
  puts [one[r] - one[l-1], two[r] - two[l-1]].join(" ")
end
