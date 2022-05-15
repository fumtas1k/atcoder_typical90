# 012 - Red Painting（★4）
# Union-Find

class UnionFind
  attr_accessor :parent #, :relation

  def initialize(n)
    @parent = Array.new(n, &:itself)
    # @relation = {}
    # n.times { @relation[_1] = [_1] }
  end

  def root(u)
    return u if u == parent[u]
    parent[u] = root(parent[u])
  end

  def same?(u, v)
    root(u) == root(v)
  end

  def unite(u, v)
    _u, _v = root(u), root(v)
    return if _u == _v
    # relation[_v] |= relation[_u]
    parent[_u] = _v
  end
end

H, W = gets.split.map(&:to_i)
Q = gets.to_i
QUERY = Array.new(Q) { gets.split.map(&:to_i) }
@red = Array.new(H) { [false] * W }
@uf = UnionFind.new(H * W)

def unite(r, c)
  _r, _c = r - 1, c - 1
  [[1,0], [0,1], [-1,0], [0,-1]].each do |dr, dc|
    nr, nc = _r + dr, _c + dc
    next if !nr.between?(0, H - 1) || !nc.between?(0, W - 1)
    next unless @red[nr][nc]
    @uf.unite(_r * W + _c, nr * W + nc)
  end
  @red[_r][_c] = true
end

def find(ra, ca, rb, cb)
  _ra, _ca = ra - 1, ca - 1
  _rb, _cb = rb - 1, cb - 1
  return false unless (@red[_ra][_ca] && @red[_rb][_cb])
  @uf.same?(_ra * W + _ca, _rb * W + _cb)
end

ans = []
QUERY.each do |q|
  if q[0] == 1
    unite(*q[1..])
  else
    ans << (find(*q[1..]) ? "Yes" : "No")
  end
end

puts ans
