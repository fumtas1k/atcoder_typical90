# 012 - Red Painting（★4）
# Union-Find

class UnionFind
  attr_accessor :parents #, :relations

  def initialize(n)
    @parents = Array.new(n, &:itself)
    # @relations = {}
    # n.times { @relations[_1] = [_1] }
  end

  def root(u)
    return u if u == parents[u]
    parents[u] = root(parents[u])
  end

  def same?(u, v)
    root(u) == root(v)
  end

  def unite(u, v)
    ru, rv = root(u), root(v)
    return if ru == rv
    # relations[_v] |= relations[_u]
    parents[ru] = rv
  end
end

H, W = gets.split.map(&:to_i)
Q = gets.to_i
QUERY = Array.new(Q) { gets.split.map(&:to_i) }
@red = Array.new(H) { [false] * W }
@uf = UnionFind.new(H * W)

def unite_red(r, c)
  r, c = r - 1, c - 1
  @red[r][c] = true
  [[1,0], [0,1], [-1,0], [0,-1]].each do |dr, dc|
    nr, nc = r + dr, c + dc
    next if !nr.between?(0, H - 1) || !nc.between?(0, W - 1)
    next unless @red[nr][nc]
    @uf.unite(r * W + c, nr * W + nc)
  end
end

def same_red?(ra, ca, rb, cb)
  ra, ca = ra - 1, ca - 1
  rb, cb = rb - 1, cb - 1
  return false unless @red[ra][ca] && @red[rb][cb]
  @uf.same?(ra * W + ca, rb * W + cb)
end

ans = []
QUERY.each do |q|
  if q[0] == 1
    unite_red(*q[1, 2])
  else
    ans << (same_red?(*q[1, 4]) ? "Yes" : "No")
  end
end

puts ans
