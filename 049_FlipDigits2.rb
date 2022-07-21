# 049 - Flip Digits 2（★6）
# 最小全域木, Union-Find, クラスカル法

class UnionFind
  attr_accessor :parents

  def initialize(size)
    @parents = Array.new(size, &:itself)
  end

  def root(u)
    return parents[u] if u == parents[u]
    parents[u] = root(parents[u])
  end

  def unite(u, v)
    _u, _v = root(u), root(v)
    return if _u == _v
    parents[_u] = _v
  end

  def same?(u, v)
    root(u) == root(v)
  end
end

N, M = gets.split.map(&:to_i)
# クラスカル法を用いるため価格でsortする
# sortよりもsort_by(&:first)の方が0.2s程速い
CLR = Array.new(M) { gets.split.map(&:to_i) }.sort_by(&:first)

cost = cnt = 0
# N+1頂点のグラフが連結できるかを考える
uf = UnionFind.new(N + 1)
ans = -1

# Union-Findとクラスカル法で最小全域木を求める
CLR.each do |c, l, r|
  next if uf.same?(l - 1, r)
  uf.unite(l - 1, r)
  cost += c
  cnt += 1
  # cnt == Nでグラフが連結
  if cnt == N
    ans = cost
    break
  end
end

puts ans
