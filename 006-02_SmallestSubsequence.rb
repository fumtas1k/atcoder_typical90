# 006 - Smallest Subsequence（★5）
# 貪欲法, 辞書順最小

N, K = gets.split.map(&:to_i)
S = gets.chomp.chars
# 使用されているアルファベットの辞書作成
dict = S.uniq.sort

# 1文字ずつ貪欲に求める
ans = ""
# Sのindex番号をposに代入. 0から開始
pos = 0
K.downto(1) do |i|
  pos = catch(:exit) do
    dict.each do |j|
      pos.upto(N - i) do |k|
        next unless j == S[k]
        ans << j
        throw(:exit, k + 1)
      end
    end
  end
end

puts ans
