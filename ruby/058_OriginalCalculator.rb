# 058 - Original Calculator（★4）
# 周期性

MOD = 10 ** 5

N, K = gets.split.map(&:to_i)

# yを返す
def degit_sum(x)
  x.to_s.chars.sum(&:to_i)
end

# nxtにはxに対するzの値を格納
nxt = []
MOD.times do |i|
  nxt[i] = (i + degit_sum(i)) % MOD
end

# time_stampには周期の順番(cnt)を格納
time_stamp = [-1] * MOD
x, cnt = N, 0
while time_stamp[x] == -1
  time_stamp[x] = cnt
  x = nxt[x]
  cnt += 1
end

# 周期数を取得（xはサイクルのstart位置）
cycle = cnt - time_stamp[x]
k = K
if k >= time_stamp[x]
  k = (k - time_stamp[x]) % cycle + time_stamp[x]
end

puts time_stamp.index(k)
