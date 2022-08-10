# 022 - Cubic Cake（★2）
# 最小公約数

def gcd(x, y)
  return x if y.zero?
  # a < bであってもここで入れ替えが起こるだけ。場合分け不要
  gcd(y, x % y)
end

X = gets.split.map(&:to_i)
GCD = X.reduce {|_gcd, x| gcd(_gcd, x) }
puts X.sum{ _1 / GCD - 1}
