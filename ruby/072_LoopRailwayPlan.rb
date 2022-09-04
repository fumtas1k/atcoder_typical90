# 072 - Loop Railway Plan（★4）
# バックトラック, 再帰関数, "何通りか"の感覚

H, W = gets.split.map(&:to_i)
C = Array.new(H) { gets.chomp.chars }
@used = Array.new(H) { [false] * W }

def dfs(sr, sc, pr, pc, cnt)
  return cnt if [sr, sc] == [pr, pc] && @used[pr][pc]
  ret = -1

  @used[pr][pc] = true
  [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |dr, dc|
    nr, nc = pr + dr, pc + dc
    next if !nr.between?(0, H - 1) || !nc.between?(0, W - 1)
    next if C[nr][nc] == "#"
    next if [sr, sc] != [nr, nc] && @used[nr][nc]
    ret = [ret, dfs(sr, sc, nr, nc, cnt + 1)].max
  end
  @used[pr][pc] = false

  ret
end

ans = -1
H.times do |i|
  W.times do |j|
    ans = [ans, dfs(i, j, i, j, 0)].max
  end
end

puts ans < 3 ? -1 : ans
