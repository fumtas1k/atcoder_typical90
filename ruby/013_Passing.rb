# 013 - Passing (★5)
# ダイクストラ法

N, M = gets.split.map(&:to_i)
G = Array.new(N) { [] }
M.times do
  a, b, c = gets.split.map(&:to_i)
  G[a - 1] << [b - 1, c]
  G[b - 1] << [a - 1, c]
end

def dijkstra(start)
  costs = [10 ** 9] * N
  costs[start] = 0

  # 最小コストの頂点をnexに入れていく
  nex = [start]

  until nex.empty?
    # 現時点での最小コストとなる頂点をposに入れる
    from = nex.shift
    G[from].each do |to, c|
      next if costs[to] <= costs[from] + c
      costs[to] = costs[from] + c
      # nexが最小コスト順の頂点になるよう二分探索を用いてinsert場所を探す
      i = nex.bsearch_index { costs[_1] > costs[to] } || nex.size
      nex.insert(i, to)
    end
  end
  costs
end

# 事前にコストを計算しておく
one_to_n = dijkstra(0)
n_to_one = dijkstra(N - 1)

puts N.times.map { one_to_n[_1] + n_to_one[_1] }
