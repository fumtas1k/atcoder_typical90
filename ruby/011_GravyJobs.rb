# 011 - Gravy Jobs（★6）
# DP法, 締め切りが早い順

N = gets.to_i
DCS = Array.new(N) { gets.split.map(&:to_i) }.sort
max_d = DCS.last[0]

# dp = Array.new(N + 1) { [0] * (max_d + 1) }
# 上記のDP法で行うと最大2.5x10^7回のループとなりTLEする
dp = [0] * (max_d + 1)

DCS.each do |d, c, s|
  d.downto(c) do |i|
    # 仕事をする場合としない場合のうち最大値を取る
    dp[i] = [dp[i], dp[i - c] + s].max
  end
end

puts dp.max
