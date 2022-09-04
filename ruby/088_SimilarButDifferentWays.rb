# 088 - Similar but Different Ways（★6）
# 鳩ノ巣原理, DFS

MAX_SUM = 8_888

N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
G = Array.new(N) { [] }
Q.times do
  x, y = gets.split.map { _1.to_i - 1 }
  G[x] << y
end

@used = [0] * N
@flag = false
@ans = Array.new(MAX_SUM + 1) { [] }

def dfs(pos, cards = [])
  return if @flag
  if pos == N
    if cards.empty?
      sum = cards.sum { A[_1] }
      # indexからカード番号に変換(+1)
      @ans[sum] << cards.map(&:succ)
      @flag = true if @ans[sum].size == 2
    end
    return
  end

  # posを選択しない場合
  dfs(pos + 1, cards)

  if @used[pos] == 0
    # posを選択する場合
    G[pos].each { @used[_1] += 1 }
    dfs(pos + 1, [*cards, pos])
    G[pos].each { @used[_1] -= 1 }
  end
end

dfs(0)

(MAX_SUM + 1).times do |i|
  next if @ans[i].size <= 1
  2.times do |j|
    puts @ans[i][j].size
    puts @ans[i][j].join(" ")
  end
  break
end
