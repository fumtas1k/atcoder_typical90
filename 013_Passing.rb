# 013 - Passing (★5)
# ダイクストラ法

N, M = gets.split.map(&:to_i)
edges = Array.new(N) { [] }
M.times do
  a, b, c = gets.split.map(&:to_i)
  edges[a - 1] << [b - 1, c]
  edges[b - 1] << [a - 1, c]
end

def dijkstra(n, start, edges)
  dist = [10 ** 18] * n
  dist[start] = 0

  # 最小コストの頂点をqに入れていく
  *q = start
  while q.size > 0
    # 現時点での最小コストとなる頂点をposに入れる
    from = q.shift
    edges[from].each do |to, cost|
      next if dist[to] <= dist[from] + cost
      dist[to] = dist[from] + cost
      # qが最小コスト順の頂点になるよう二分探索を用いてinsert場所を探す
      i = q.bsearch_index{dist[_1] > dist[to]} || q.size
      q.insert(i, to)
    end
  end
  dist
end

# 事前にcost計算しておく
dist1 = dijkstra(N, 0, edges)
distN = dijkstra(N, N-1, edges)

ans = (0...N).reduce([]) {|arr, i| arr << dist1[i] + distN[i]}
puts ans
