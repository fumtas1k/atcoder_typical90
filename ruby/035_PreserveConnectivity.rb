# 035 - Preserve Connectivity（★7）
# 木DP, 最近共通祖先(LCA), 座標圧縮

N = gets.to_i
BIT = N.bit_length
G = Array.new(N){[]}
(N - 1).times do
  a, b = gets.split.map(&:to_i).map(&:pred)
  G[a] << b
  G[b] << a
end
Q = gets.to_i

@parents = Array.new(BIT) { [0] * N }
# 頂点0からの深さ
@depth = [0] * N
# dfs順の番号をメモ
@orders = []
# 現在の順番
@cur_ord = 0

def dfs(pos = 0, pre = 0)
  @parents[0][pos] = pre
  @orders[pos] = @cur_ord
  @cur_ord += 1
  G[pos].each do |to|
    next if to == pre
    @depth[to] = @depth[pos] + 1
    dfs(to, pos)
  end
end

dfs

# ダブリング
(BIT - 1).times do |i|
  N.times do |j|
    @parents[i + 1][j] = @parents[i][@parents[i][j]]
  end
end

# LCA(最近共通祖先)
def lca(u, v)
  u, v = v, u if @depth[u] < @depth[v]
  diff = @depth[u] - @depth[v]
  BIT.times do |i|
    next if diff[i].zero?
    u = @parents[i][u]
  end

  return u if u == v

  (BIT - 1).downto(0) do |i|
    # 2のi乗個上の頂点ではなく1個上の頂点が知るため
    next if @parents[i][u] == @parents[i][v]
    u = @parents[i][u]
    v = @parents[i][v]
  end
  @parents[0][u]
end

ans = [0] * Q
Q.times do |i|
  k, *v = gets.split.map(&:to_i)
  # 巡回順に並び替え
  v.map!(&:pred).sort_by! { @orders[_1] }

  v.each_with_index do |vj, j|
    # v[j]までの深さ から v[(j + 1) % k]との
    # 最近共通祖先までの深さを引くと辺の数が求められる
    ans[i] += @depth[vj] - @depth[lca(vj, v[(j + 1) % k])]
  end
end

puts ans
