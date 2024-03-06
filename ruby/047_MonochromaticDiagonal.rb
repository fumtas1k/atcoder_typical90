# 047 - Monochromatic Diagonal（★7）
# ローリングハッシュ

B = 3 # Mより小さい素数
M = 10 ** 9 + 7 # 大きめの素数
COLOR_NUM = {"R" => 0, "G" => 1, "B" => 2}

N = gets.to_i
seq1 = gets.chomp.chars.map { COLOR_NUM[_1] }
seq3 = gets.chomp.chars.map { COLOR_NUM[_1] }

ans = 0
# R, G, B の３パターン
3.times do |i|
  seq2 = []
  # seq3を変換することで、seq1の部分列とseq2の部分列が一致する場合は全て同じ色で塗れると判定できる
  N.times do |j|
    seq2 << (i - seq3[j] + 3) % 3
  end
  pow = 1
  hash1 = hash2 = 0
  # k >= 0の場合: S1 .. Sn-k と Tk+1 .. Tn が一致するものを加算
  N.times do |j|
    hash1 = (hash1 * B + seq1[j]) % M
    hash2 = (hash2 + pow * seq2[N - j - 1]) % M
    ans += 1 if hash1 == hash2
    pow = pow * B % M
  end

  pow = 1
  hash1 = hash2 = 0
  # k < 0の場合: S-k+1 .. Sn と T1 .. Tn+k が一致するものを加算
  (N - 1).times do |j|
    hash1 = (hash1 + pow * seq1[N - j - 1]) % M
    hash2 = (hash2 * B + seq2[j]) % M
    ans += 1 if hash1 == hash2
    pow = pow * B % M
  end
end

puts ans
