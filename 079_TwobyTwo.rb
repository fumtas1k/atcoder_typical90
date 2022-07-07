# 079 - Two by Two（★3）
#

H, W = gets.split.map(&:to_i)
A = Array.new(H) { gets.split.map(&:to_i) }
B = Array.new(H) { gets.split.map(&:to_i) }

ans = 0
(H - 1).times do |i|
  (W - 1).times do |j|
    diff = B[i][j] - A[i][j]
    next if diff == 0
    ans += diff.abs
    2.times do |di|
      2.times do |dj|
        A[i + di][j + dj] += diff
      end
    end
  end
end

if A == B
  puts "Yes"
  puts ans
else
  puts "No"
end
