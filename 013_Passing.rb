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
  times = [10 ** 9] * N
  times[start] = 0

  # 最小コストの頂点をnexに入れていく
  nex = [start]

  until nex.empty?
    # 現時点での最小コストとなる頂点をposに入れる
    from = nex.shift
    G[from].each do |to, c|
      next if times[to] <= times[from] + c
      times[to] = times[from] + c
      # nexが最小コスト順の頂点になるよう二分探索を用いてinsert場所を探す
      i = nex.bsearch_index { times[_1] > times[to] } || nex.size
      nex.insert(i, to) unless nex[i - 1] == to
    end
  end
  times
end

# 事前にコストを計算しておく
one_to_n = dijkstra(0)
n_to_one = dijkstra(N - 1)

puts N.times.reduce([]) {|arr, i| arr << one_to_n[i] + n_to_one[i] }
