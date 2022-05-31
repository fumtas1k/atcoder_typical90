# 025 - Digit Product Equation（★7）
# 再帰関数

N, B = gets.split.map(&:to_i)

@fms = [0]
# fmの候補を作成. mが234も243もf(m)は同じ値となるため探索を省略
def dfs(size, num, nex)
  return @fms << num if size == 0
  nex.upto(9) { dfs(size - 1, num * _1, _1) }
end
dfs(N.to_s.size, 1, 1)

ans = @fms.uniq.count do |fm|
  m = B + fm
  next if m > N
  # fmとfm候補のiが同じになるかチェック
  fm == m.to_s.chars.map(&:to_i).reduce(:*)
end

puts ans
