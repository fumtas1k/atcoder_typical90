# 087 - Chokudai's Demand（★5）
# ワーシャルフロイド法, 二分探索法

N, P, K = gets.split.map(&:to_i)
A = Array.new(N) { gets.split.map(&:to_i) }

def count_number(x)
  dist = Array.new(N) { [] }
  N.times do |i|
    N.times do |j|
      dist[i][j] = (A[i][j] == -1 ? x : A[i][j])
    end
  end

  # ワーシャルフロイド法
  N.times do |k|
    N.times do |i|
      next if k == i
      N.times do |j|
        dist[i][j] = [dist[i][j], dist[i][k] + dist[k][j]].min
      end
    end
  end

  cnt = 0
  N.times do |i|
    (i + 1).upto(N - 1) do |j|
      cnt += 1 if dist[i][j] <= P
    end
  end
  cnt
end

def get_border(cnt)
  (1..10 ** 9).bsearch { count_number(_1) <= cnt }
end

l = get_border(K)
r = get_border(K - 1)
ans =
  if l && r
    r - l
  elsif !l && !r
    0
  else
    "Infinity"
  end

puts ans
