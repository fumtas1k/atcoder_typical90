# 017 - Crossing Segments（★7）
# 余事象
# BIT(FenwickTree)

class FenwickTree
  attr_accessor :data, :size

  def initialize(arg)
    case arg
    when Array
      @size = arg.size
      @data = [0].concat(arg)
      1.upto(@size) do |i|
        up = i + (i & -i)
        next if up > @size
        @data[up] += @data[i]
      end
    when Integer
      @size = arg
      @data = Array.new(@size + 1, 0)
    end
  end

  def add(pos, value)
    idx = pos + 1
    while idx <= size
      data[idx] += value
      idx += idx & -idx
    end
  end

  # [l, r)
  def sum(l, r=nil)
    r ? _sum(r) - _sum(l) : _sum(l)
  end

  def _sum(r)
    idx = r
    res = 0
    while idx > 0
      res += data[idx]
      idx -= idx & -idx
    end
    res
  end
end

N, M = gets.split.map(&:to_i)
LR = []
COUNT = Array.new(N, 0)
R = Array.new(N, 0)
M.times do
  l, r = gets.split.map(&:to_i).map(&:pred)
  LR << [l, r]
  COUNT[l] += 1
  COUNT[r] += 1
  R[r] += 1
end

# 全体の場合の数
total = M * (M - 1) / 2

# ① 端点で交わる場合の数
comp1 = COUNT.sum { _1 * (_1 - 1) / 2 }

# ② Rs < Ltの場合の数
rcsum = R.reduce([0]) {|acc, i| acc << acc[-1] + i }
comp2 = LR.sum {|l, _| rcsum[l] }

# ③ 片方の区間内に入る場合の数
L = Array.new(N, 0)
lcsum = FenwickTree.new(N)
comp3 = 0
LR.sort_by { [_1[1], _1[0]] }.each do |l, r|
  comp3 += lcsum.sum(l + 1, r)
  lcsum.add(l, 1)
end

puts total - comp1 - comp2 - comp3
