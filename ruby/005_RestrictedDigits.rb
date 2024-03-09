# 005 - Restricted Digits（★7）
# 桁DP
# ダブリング

M = 10 ** 9 + 7
LOG = 62

N, B, K = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)

# dp[i]とdp[j]を掛け合わせてdp[i + j]を得る
# tenj = 10^j % B
def mul(dpi, dpj, tenj)
  Array.new(B, 0).tap do |res|
    k = 0
    while k < B
      l = 0
      while l < B
        m = (k * tenj + l) % B
        res[m] = (res[m] + dpi[k] * dpj[l]) % M
        l += 1
      end
      k += 1
    end
  end
end

# 10^(2^i) % B の値
ten = [0] * LOG
ten[0] = 10
LOG.times { ten[_1 + 1] = ten[_1].pow(2, B) }

# 2^i 桁数
# dp[2^i] = doubling[i]
doubling = Array.new(LOG) { [0] * B }
C.each { doubling[0][_1 % B] += 1 }

# ダブリング
LOG.times do |i|
  doubling[i + 1] = mul(doubling[i], doubling[i], ten[i])
end

# ダブリングした結果をもとに答えを求める
res = [0] * B
res[0] = 1
LOG.times do |i|
  next if N[i].zero?
  res = mul(res, doubling[i], ten[i])
end

puts res[0]
