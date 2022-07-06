# 078 - Easy Graph Problem（★2）
# グラフの基本

N, M = gets.split.map(&:to_i)
G = Array.new(N) { [] }
M.times do
  a, b = gets.split.map { _1.to_i - 1 }
  G[a] << b
  G[b] << a
end

ans = N.times.count do |i|
    j = G[i].sort.bsearch_index { _1 >= i } || G[i].size
    j == 1
  end

puts ans
