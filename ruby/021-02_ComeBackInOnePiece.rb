# 021 - Come Back in One Piece（★5）
# 強連結成分分解

class SCC
  attr_reader :size, :edges

  def initialize(n)
    @size = n
    @edges = Array.new(@size) { [] }
  end

  def add_edge(from, to) = edges[from] << to

  def add_edges(arr)
    arr.each { add_edge(_1, _2) }
  end

  def scc
    group_num, ids = scc_ids
    groups = Array.new(group_num) { [] }
    ids.each_with_index { groups[_1] << _2 }
    groups
  end

  private
  def scc_ids
    cur_ord = group_num = 0
    visited = []
    low = []
    ord = []
    ids = []

    dfs = -> from do
      low[from] = ord[from] = cur_ord
      cur_ord += 1
      visited << from
      edges[from].each do |to|
        if ord[to]
          low[from] = [low[from], ord[to]].min
        else
          dfs.(to)
          low[from] = [low[from], low[to]].min
        end
      end

      return unless low[from] == ord[from]

      until visited.empty?
        to = visited.pop
        ord[to] = size
        ids[to] = group_num
        break if to == from
      end
      group_num += 1
    end

    size.times do |i|
      dfs.(i) unless ord[i]
    end

    ids.map! { group_num - 1 - _1 }
    [group_num, ids]
  end
end

N, M = gets.split.map(&:to_i)

scc = SCC.new(N)

Array.new(M) { gets.split.map(&:to_i).map(&:pred) }.then { scc.add_edges(_1) }

ans = scc.scc.sum do |group|
  group.size * (group.size - 1) / 2
end

puts ans
