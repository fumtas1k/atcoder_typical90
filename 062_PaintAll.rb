# 062 - Paint All（★6）
# 幅優先探索, 後ろから考える

# 後ろから考えるので全てのボールが黒色
N = gets.to_i
G = Array.new(N) { [] }
usable = [false] * N # すでに白にできたもの
queue = [] # 白に変更したリスト

N.times do |i|
  a, b = gets.split.map { _1.to_i - 1 }
  G[a] << i
  G[b] << i
  next if a != i && b != i
  usable[i] = true
  queue << i
end

ans = []
until queue.empty?
  pos = queue.shift
  ans << pos + 1
  G[pos].each do |i|
    next if usable[i]
    usable[i] = true
    queue << i
  end
end

puts ans.size == N ? ans.reverse : -1
