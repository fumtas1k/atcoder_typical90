# 057 - Flip Flap（★6）
# 掃き出し法

MOD = 998_244_353

N, M = gets.split.map(&:to_i)
D = Array.new(N) { [0] * M }
N.times do |i|
  _ = gets
  gets.split.each { D[i][_1.to_i - 1] = 1 }
end
S = gets.split.map(&:to_i)

pos = 0
M.times do |i|
  found = false
  (pos...N).each do |j|
    if D[j][i] == 1
      D[pos], D[j] = D[j], D[pos] if pos != j
      found = true
      break
    end
  end
  if found
    (pos...N).each do |j|
      next if j == pos || D[j][i] == 0
      (i...M).each do |k|
        D[j][k] ^= D[pos][k]
      end
    end
    if S[i] == 1
      (i...M).each do |j|
        S[j] ^= D[pos][j]
      end
    end
    pos += 1
  end
end

ans = 0
if S.sum.zero?
  # pos前までのスイッチはSが全て0にするために必要。つまり1パターンのみ
  # 全て0になったスイッチは使っても使わなくても同じ結果なのでそれぞれ2パターン
  ans = (pos...N).reduce(1) {|total, _| total * 2 % MOD }
end

puts ans
