# 068 - Paired Information（★5）
# クエリ先読み, Union-Find

class UnionFind
  attr_accessor :parents

  def initialize(size)
    @parents = Array.new(size, &:itself)
  end

  def root(u)
    return parents[u] if u == parents[u]
    root(parents[u])
  end

  def unite(u, v)
    ru, rv = root(u), root(v)
    return if ru == rv
    parents[rv] = root(ru)
  end

  def same?(u, v)
    root(u) == root(v)
  end
end

N = gets.to_i
Q = gets.to_i
T, X, Y, V = [], [], [], []
sum = [0] * (N - 1)
Q.times do |i|
  T[i], X[i], Y[i], V[i] = gets.split.map(&:to_i)
  X[i] -= 1
  Y[i] -= 1
  sum[X[i]] = V[i] if T[i] == 0
end

A = [0] * N
sum.each_with_index do |s, i|
  A[i + 1] = s - A[i]
end

uf = UnionFind.new(N)
ans = []
Q.times do |i|
  t, x, y, v = T[i], X[i], Y[i], V[i]
  if t == 0
    uf.unite(x, y)
  else
    # x~yまでの値が定まるかをunionfindで判定
    if uf.same?(x, y)
      diff = v - A[x]
      # ti = 0の時、viを隣と分け合うため変化量は偶数番目と奇数番目で正負が異なる
      ans << ((x - y).abs % 2 == 0 ? A[y] + diff : A[y] - diff)
    else
      ans << "Amiguous"
    end
  end
end

puts ans
