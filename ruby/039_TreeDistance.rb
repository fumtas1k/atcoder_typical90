# 039 - Tree Distance（★5）
# 貢献度, 再帰関数

N = gets.to_i
G = Array.new(N + 1) { [] }
(N - 1).times do
  a, b = gets.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

# posの自分を含めた配下の頂点数をcntで求めると共に
# 頂点posと頂点preを結ぶ辺の貢献度を@ansに加算する
# 貢献度の合計が最短距離の合計となる
def dfs(pos, pre)
  cnt = 1
  G[pos].each do |i|
    next if i == pre
    cnt += dfs(i, pos)
  end
  @ans += cnt * (N - cnt)
  cnt
end

@ans = 0
dfs(1, -1)
puts @ans
