# 082 - Counting Numbers（★3）
# 数列の和の公式, 部分問題に分解

MOD = 10 ** 9 + 7

L, R = gets.split.map(&:to_i)
cnt = Math.log(L, 10).to_floor + 1
ans = 0
l, r = L, -1
while r != R
  r = [10 ** cnt - 1, R].min
  ans += cnt * (r * (r + 1) - (l - 1) * l) / 2
  ans %= MOD
  l = r + 1
  cnt += 1
end

puts ans
