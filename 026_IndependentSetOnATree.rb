# 026 - Independent Set on a Tree（★4）
# 二部グラフ　再帰関数

N = gets.to_i
G = Hash.new {|hash, key| hash[key] = [] }
(N - 1).times do |i|
  a, b = gets.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

USED = []
G01 = [[], []]
def dfs(pos = 1, parity = 0)
  return if USED[pos]
  USED[pos] = true
  G01[parity] << pos
  G[pos].each { dfs(_1, 1 - parity) }
end

dfs(1, 0)
ans = G01.max_by(&:size)[0, N / 2]
puts ans.join(" ")
