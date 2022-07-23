# 043 - Maze Challenge with Lack of Sleep（★4）
# 拡張BFS(01-BFS)
# 01-BFSではTLEするため使用していない。

H, W = gets.split.map(&:to_i)
sr, sc = gets.split.map { _1.to_i - 1 }
tr, tc = gets.split.map { _1.to_i - 1 }

# 文字の判定より数字の判定の方が速度が速いため置き換え
S = Array.new(H) { gets.chomp.chars.map { _1 == "." ? 0 : 1 } }

dist = Array.new(H) { Array.new(W, 10 ** 9) }
dist[sr][sc] = 0
directs = [[1, 0], [0, 1], [-1, 0], [0, -1]]

deq = [[sr, sc]]

while !deq.empty?
  r, c = deq.shift
  directs.each do |dr, dc|
    nr, nc = r + dr, c + dc

    # 以下のループで行けるところまで同じ方向に進むため、[r, c]で常に方向を変えることになる
    # ただし、startのみ方向は自由なため、後で1を引く
    cost = dist[r][c] + 1

    # between?よりも以下の記載の方が速度が速い(betweenを使用するとTLEする)
    while nr >= 0 && nr < H && nc >= 0 && nc < W && S[nr][nc] == 0 && dist[nr][nc] >= cost
      dist[nr][nc] = cost
      deq << [nr, nc]
      nr += dr
      nc += dc
    end
  end
end

puts dist[tr][tc] - 1

# 以下は01-BFSの解法
# 01-BFSはコストが0であれば、キューの先頭に追加、そうでなければ最後尾に追加する方法

H, W = gets.split.map(&:to_i)
sr, sc = gets.split.map { _1.to_i - 1 }
tr, tc = gets.split.map { _1.to_i - 1 }
S = Array.new(H) { gets.chomp.chars }
dist = Array.new(H) { Array.new(W) { [10 ** 18] * 4 } }
directs = [[1, 0], [0, 1], [-1, 0], [0, -1]]

deq = []
4.times do |i|
  dist[sr][sc][i] = 0
  deq << [sr, sc, i]
end

while !deq.empty? && dist[tr][tc].any?(10 ** 18)
  r, c, dir = deq.shift
  directs.each_with_index do |(dr, dc), i|
    nr, nc = r + dr, c + dc
    cost = dist[r][c][dir] + (dir == i ? 0 : 1)
    next if !nr.between?(0, H - 1) || !nc.between?(0, W - 1)
    next if S[nr][nc] == "#" || dist[nr][nc][i] <= cost
    dist[nr][nc][i] = cost
    dir == i ? deq.unshift([nr, nc, i]) : deq << [nr, nc, i]
  end
end

puts dist[tr][tc].min
