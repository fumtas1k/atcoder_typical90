# 075 - Magic For Balls（★3）
# 素因数分解

require "prime"

N = gets.to_i
division_cnt = Prime.prime_division(N).sum { _1[1] }
puts Math.log(division_cnt, 2).ceil
