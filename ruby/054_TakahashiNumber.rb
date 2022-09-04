# 054 - Takahashi Number
# 最短経路問題, 幅優先探索, グラフの辺数削減, エルデシュ数


N, M = gets.split.map(&:to_i)
G = Array.new(N + M) { [] }
M.times do |i|
  _ = gets
  gets.split.map(&:to_i).each do |j|
    G[j - 1] << N + i
    G[N + i] << j - 1
  end
end

log = [0]
dist = [-2] * (N + M)
dist[0] = 0

while !log.empty?
  pos = log.shift
  G[pos].each do |i|
    next unless dist[i] == -2
    dist[i] = dist[pos] + 1
    log << i
  end
end

puts dist[0, N].map { _1 / 2 }
