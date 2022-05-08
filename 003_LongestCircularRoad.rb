# 003 - Longest Circular Road（★4）
# 木の直径

N = gets.to_i
G = Hash.new {|hash, key| hash[key] = [] }
(N-1).times do |i|
  a, b = gets.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

# startから各nodeの距離を計測し、[最短距離の最大値, そのindex]を返す
def distance(start)
  dist = [0]
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
_, maxid = distance(1)

# 頂点maxidから、最短距離の最大値 = 木の直径（最短距離の最大値）を求める
max, _ = distance(maxid)
puts max + 1
