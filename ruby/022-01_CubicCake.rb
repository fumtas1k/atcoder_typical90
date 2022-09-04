# 022 - Cubic Cake（★2）
# 最小公約数

X = gets.split.map(&:to_i)
GCD = X.reduce {|gcd, x| gcd.gcd x }
puts X.sum { _1 / GCD - 1}
