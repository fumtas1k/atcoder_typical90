# 035 - Preserve Connectivity（★7）
# 木DP, 最近共通祖先(LCA), 座標圧縮

N = gets.to_i
BIT = N.bit_length
edges = Array.new(N + 1) { [] }
(N - 1).times do
  a, b = gets.split.map(&:to_i)
  edges[a] << b
  edges[b] << a
end

# 親の位置を記録する配列
parents = Array.new(BIT) { [0] }
# 頂点0からの深さ
depth = [0]
# dfs順の番号をメモ
orders = [0]
# 現在の順番
cur_ord = 1
dfs = -> (pos = 1, pre = 0) do
  parents[0][pos] = pre
  depth[pos] = depth[pre] + 1
  orders[pos] = cur_ord
  cur_ord += 1
  edges[pos].each do |nxt|
    next if nxt == pre
    dfs.(nxt, pos)
  end
end

dfs.()

# ダブリング
(BIT - 1).times do |i|
  1.upto(N) do |j|
    parents[i + 1][j] = parents[i][parents[i][j]]
  end
end

# LCA(最近共通祖先)
lca = -> (u, v) do
  u, v = v, u if depth[u] < depth[v]
  diff = depth[u] - depth[v]

  # u と v の深さを合わせる
  BIT.times do |i|
    next if diff[i].zero?
    u = parents[i][u]
  end

  return u if u == v

  (BIT - 1).downto(0) do |i|
    # 2のi乗個上の頂点ではなく1個上の頂点が知るため
    next if parents[i][u] == parents[i][v]
    u = parents[i][u]
    v = parents[i][v]
  end
  parents[0][u]
end

ans = gets.to_i.times.map do |i|
  k, *v = gets.split.map(&:to_i)
  # 巡回順に並び替え
  v.sort_by! { orders[_1] }

  k.times.reduce(0) do |acc, j|
    # v[j]までの深さ と v[(j + 1) % k]との最近共通祖先までの深さの差が必要な辺の数
    acc + depth[v[j]] - depth[lca.(v[j], v[(j + 1) % k])]
  end
end

puts ans
