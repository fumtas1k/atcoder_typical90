# 038 - Large LCM（★3）
# ユークリッド互除法, オーバーフロー

A, B = gets.split.map(&:to_i)
def gcd(a, b)
  return a if b == 0
  gcd(b, a % b)
end
C = A / gcd(A, B)
puts B <= 10 ** 18 / C ? C * B : "Large"

# rubyはオーバーフローにならないので以下でOK
# A, B = gets.split.map(&:to_i)
# puts (ans = A.lcm B) <= 10 ** 18 ? ans : "Large"
