# 046 - I Love 46（★3）
# 同じものをまとめる, 剰余

MOD = 46
N = gets.to_i
A = Hash.new(0)
B = Hash.new(0)
C = Hash.new(0)
gets.split.each { A[_1.to_i % MOD] += 1 }
gets.split.each { B[_1.to_i % MOD] += 1 }
gets.split.each { C[_1.to_i % MOD] += 1 }

ans = 0
A.each do |ka, va|
  B.each do |kb, vb|
    C.each do |kc, vc|
      ans += va * vb * vc if (ka + kb + kc) % MOD == 0
    end
  end
end

puts ans
