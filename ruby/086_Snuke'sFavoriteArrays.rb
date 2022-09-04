# 086 - Snuke's Favorite Arrays（★5
# bit全探索, bit毎に独立に考える

MOD = 10 ** 9 + 7

N, Q = gets.split.map(&:to_i)
XYZW = Array.new(Q) { gets.split.map(&:to_i) }

# 引数wはあるbit(桁)でのWの値(0 or 1)の配列
# 条件を満たしている場合の数を返す
def bit_full_search(x, y, z, w)
  ways = 0
  [0, 1].repeated_permutation(N) do |bit|
    flag = true
    Q.times do |i|
      next if bit[x[i]] | bit[y[i]] | bit[z[i]] == w[i]
      flag = false
      break
    end
    ways += 1 if flag
  end
  ways
end

ans = 1
# bit(桁)毎に考える
60.times do |i|
  x, y, z, w = [], [], [], []
  Q.times do |j|
    x[j], y[j], z[j] = XYZW[j][0, 3].map(&:pred)
    w[j] = XYZW[j][-1][i]
  end
  ans *= bit_full_search(x, y, z, w) % MOD
  ans %= MOD
end

puts ans
