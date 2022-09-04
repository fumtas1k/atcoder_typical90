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

until deq.empty?
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
