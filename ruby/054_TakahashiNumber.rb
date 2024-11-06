# 054 - Takahashi Number
# 最短経路問題, 幅優先探索, グラフの辺数削減, エルデシュ数

N, M = gets.split.map(&:to_i)
G = Array.new(N + M) { [] }
M.times do |i|
  gets
  gets.split.map(&:to_i).map(&:pred).each do |j|
    # 研究者同士の繋がりは、共著論文を通してつながるため、
    # 研究者も共著論文も頂点とみなす
    # 本来なら、隣接する研究者の距離は1だが、共著論文を通してつながるため、距離は2倍の2と表現される
    # そのため、最後に2で割ることで、研究者同士の距離を求める
    G[N + i] << j
    G[j] << N + i
  end
end

log = [0]
dists = Array.new(N + M, -2)
dists[0] = 0
until log.empty?
  pos = log.shift
  G[pos].each do |to|
    next unless dists[to] == -2
    dists[to] = dists[pos] + 1
    log << to
  end
end

puts dists[0, N].map { _1 >> 1 }
