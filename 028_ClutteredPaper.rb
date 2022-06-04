# 028 - Cluttered Paper（★4）
# いもす法

M = 1_000
cnt = Array.new(M + 1) { [0] * (M + 1) }

N = gets.to_i
N.times do |i|
  lx, ly, rx, ry = gets.split.map(&:to_i)
  cnt[ly][lx] += 1
  cnt[ry][lx] -= 1
  cnt[ly][rx] -= 1
  cnt[ry][rx] += 1
end

2.times do |k|
  (k..M).each do |i|
    (1 - k..M).each do |j|
      cnt[i][j] += cnt[i - k][j - 1 + k]
    end
  end
end

ans = [0] * (N + 1)
cnt.flatten.each { ans[_1] += 1 }

puts ans[1..]
