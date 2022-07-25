# 003 - Longest Circular Road（★4）
# 木の直径, bfs

N = gets.to_i
G = Array.new(N) { [] }
(N-1).times do |i|
  a, b = gets.split.map { _1.to_i - 1 }
  G[a] << b
  G[b] << a
end

# startから各nodeの距離を計測し、[最短距離の最大値, そのindex]を返す
def distance(start)
  dist = []
  dist[start] = 0
  log = [start]

  while log.size > 0
    from = log.shift
    G[from].each do |to|
      next if dist[to]
      dist[to] = dist[from] + 1
      log << to
    end
  end
  [dist.max, dist.index(dist.max)]
end

# 頂点1からの最短距離の最大値となる頂点
_, max_id = distance(0)

# 頂点max_idから、木の直径（最短距離の最大値）を求める
max, _ = distance(max_id)
puts max + 1
