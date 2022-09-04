# 043 - Maze Challenge with Lack of Sleep（★4）
# 以下は01-BFSの解法
# 01-BFSはコストが0であれば、キューの先頭に追加、そうでなければ最後尾に追加する方法

H, W = gets.split.map(&:to_i)
sr, sc = gets.split.map { _1.to_i - 1 }
tr, tc = gets.split.map { _1.to_i - 1 }
S = Array.new(H) { gets.chomp.chars.map { _1 == "." ? 0 : 1 } }
dist = Array.new(H) { Array.new(W) { [10 ** 9] * 4 } }
directs = [[1, 0], [0, 1], [-1, 0], [0, -1]]

deq = []
4.times do |i|
  dist[sr][sc][i] = 0
  deq << [sr, sc, i]
end

while !deq.empty? && dist[tr][tc].any?(10 ** 9)
  r, c, dir = deq.shift
  directs.each_with_index do |(dr, dc), i|
    nr, nc = r + dr, c + dc
    cost = dist[r][c][dir] + (dir == i ? 0 : 1)
    next if !nr.between?(0, H - 1) || !nc.between?(0, W - 1)
    next if S[nr][nc] == 1 || dist[nr][nc][i] <= cost
    dist[nr][nc][i] = cost
    i == dir ? deq.unshift([nr, nc, i]) : deq << [nr, nc, i]
  end
end

puts dist[tr][tc].min
