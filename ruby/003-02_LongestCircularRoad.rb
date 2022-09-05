# 003 - Longest Circular Road（★4）
# 木の直径, dfs

N = gets.to_i
G = Array.new(N) { [] }
(N - 1).times do
  a, b = gets.split.map { _1.to_i - 1 }
  G[a] << b
  G[b] << a
end

def dfs(pos, pre)
  G[pos].each do |i|
    next if i == pre
    @dist[i] = @dist[pos] + 1
    dfs(i, pos)
  end
end

@dist = [1] * N
# dfsを用いて、頂点0(1)からの最短距離を@distに記録し、最短距離の最大となる頂点を特定する
dfs(0, -1)
max_id = @dist.index(@dist.max)

@dist = [1] * N
# 頂点max_idから、最短距離の最大値（木の直径）を求める
dfs(max_id, -1)
puts @dist.max
