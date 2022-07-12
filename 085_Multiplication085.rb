# 085 - Multiplication 085（★4）
# 全件探索, 約数列挙

K = gets.to_i

limit = Math.sqrt(K).floor
divisors = []
(1..limit).each do |i|
  divisors << i if K % i == 0
end

size = divisors.size
ans = 0
size.times do |i|
  (i...size).each do |j|
    a, b = divisors[i], divisors[j]
    c, remain = K.divmod(a * b)
    next if remain != 0 || a * b * c != K
    next if c < b
    ans += 1
  end
end

puts ans
