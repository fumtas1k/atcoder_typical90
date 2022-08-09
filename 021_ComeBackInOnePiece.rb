# 021 - Come Back in One Piece（★5）
# 強連結成分分解

N, M = gets.split.map(&:to_i)
GOTO = Array.new(N) { [] }
BACKTO = Array.new(N) { [] }
M.times do
  a, b = gets.split.map { _1.to_i - 1 }
  GOTO[a] << b
  BACKTO[b] << a
end

def dfs1(pos)
  return if @used[pos]
  @used[pos] = true
  GOTO[pos].each { dfs1(_1) }
  @log << pos
end

def dfs2(pos)
  return 0 if @used[pos]
  @used[pos] = true
  cnt = 1
  BACKTO[pos].each { cnt += dfs2(_1) }
  cnt
end

@used = [false] * N
@log = []
N.times { dfs1(_1) }

@used = [false] * N
ans = 0
ans = @log.reverse.sum do |pos|
  cnt = dfs2(pos)
  cnt * (cnt - 1) / 2
end

puts ans
