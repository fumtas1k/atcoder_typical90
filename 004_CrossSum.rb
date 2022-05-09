# 004 - Cross Sum（★2）
# 包除原理

H, W = gets.split.map(&:to_i)
A = Array.new(H) { gets.split.map(&:to_i) }

r_sum = A.map { _1.sum }
c_sum = A.transpose.map { _1.sum }

ans =
  H.times.map do |i|
    W.times.map do |j|
      r_sum[i] + c_sum[j] - A[i][j]
    end
  end

ans.each { puts _1.join(" ") }
