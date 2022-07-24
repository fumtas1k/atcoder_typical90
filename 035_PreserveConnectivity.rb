# 035 - Preserve Connectivity（★7）
# 木DP, 最近共通祖先(LCA), 座標圧縮

N = gets.to_i
G = Array.new(N) { [] }
(N - 1).times do
  a, b = gets.split.map { _1.to_i - 1 }
  G[a] << b
  G[b] << a
end

BITS = N.bit_length
# ダブリング用
@par = Array.new(BITS + 1) { [0] * N }
# 頂点0からの深さ
@depth = [0] * N
# dfs順の番号をメモ
@id = [0] * N
@k_id = 0

def build_tree(pos, pre)
  @par[0][pos] = pre
  @id[pos] += @k_id
  @k_id += 1

  G[pos].each do |i|
    next if i == pre
    @depth[i] = @depth[pos] + 1
    build_tree(i, pos)
  end
end

build_tree(0, 0)

# ダブリング
(1..BITS).each do |i|
  N.times do |j|
    @par[i][j] = @par[i - 1][@par[i - 1][j]]
  end
end

# LCA(最近共通祖先)
def lca(va, vb)
  va, vb = vb, va if @depth[va] < @depth[vb]
  (BITS - 1).downto(0) do |i|
    next if @depth[va] - @depth[vb] < (1 << i)
    va = @par[i][va]
  end

  return va if va == vb
  (BITS - 1).downto(0) do |i|
    next if @par[i][va] == @par[i][vb]
    va = @par[i][va]
    vb = @par[i][vb]
  end

  @par[0][va]
end

Q = gets.to_i
ans = [0] * Q
Q.times do |i|
  kv = gets.split.map(&:to_i)
  k = kv.shift
  # 巡回順に並び替え
  v = kv.map(&:pred).sort_by { @id[_1] }

  k.times do |j|
    # v[j]までの深さ から v[(j + 1) % k]との最近共通祖先までの深さを引くと変の数が求められる
    ans[i] += @depth[v[j]]
    ans[i] -= @depth[lca(v[j], v[(j + 1) % k])]
  end
end

puts ans
