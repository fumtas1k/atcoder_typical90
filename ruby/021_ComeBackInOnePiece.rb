# 021 - Come Back in One Piece（★5）
# 強連結成分分解

N, M = gets.split.map(&:to_i)
GOTO = Array.new(N) { [] }
BACKTO = Array.new(N) { [] }
M.times do
  a, b = gets.split.map(&:to_i).map(&:pred)
  GOTO[a] << b
  BACKTO[b] << a
end

@log = []
@used = [false] * N
def dfs1(pos)
  return if @used[pos]
  @used[pos] = true
  GOTO[pos].each { dfs1(_1) }
  @log << pos
end

def dfs2(pos)
  return 0 if @used[pos]
  @used[pos] = true
  BACKTO[pos].sum(1) { dfs2(_1) }
end

N.times { dfs1(_1) }

@used.fill(false)
ans = @log.reverse.sum do |i|
  cnt = dfs2(i)
  cnt * (cnt - 1) / 2
end

puts ans
