# 052 - Dice Product（★3）
# 因数分解

MOD = 10 ** 9 + 7
N = gets.to_i
A = Array.new(N) { gets.split.map(&:to_i) }
puts A.reduce(1) {|sum, arr| sum * arr.sum % MOD }
