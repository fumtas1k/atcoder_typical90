# 031 - VS AtCoder（★6）
# grundy

W_MAX = 50
B_MAX = W_MAX + W_MAX * (W_MAX + 1) / 2

N = gets.to_i
W = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)


grundy = Array.new(W_MAX + 1) { [] }

(W_MAX + 1).times do |i|
  (B_MAX + 1).times do |j|
    transit = [false] * (B_MAX + 1)
    transit[grundy[i - 1][j + i]] = true if i >= 1 && j + i <= B_MAX

    1.upto(j / 2) { transit[grundy[i][j - _1]] = true } if j >= 2

    (B_MAX + 1).times do |k|
      next if transit[k]
      grundy[i][j] = k
      break
    end
  end
end

sum_xor = N.times.reduce(0) {|result, i| result ^ grundy[W[i]][B[i]] }

puts sum_xor == 0 ? "Second" : "First"
