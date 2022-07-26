# 006 - Smallest Subsequence（★5）
# 貪欲法

N, K = gets.split.map(&:to_i)
S = gets.chomp.chars

# 前計算（インデックスを記録)
nex = Array.new(N + 1) { [N] * 26 }
(N - 1).downto(0) do |i|
  # Sのindexがiの時点で最も左にある("a".ord + j).chrのSでのindexをメモ
  26.times do |j|
    nex[i][j] = nex[i + 1][j]
  end
  nex[i][S[i].ord - "a".ord] = i
end

# 1文字ずつ貪欲に求める
ans = ""
# Sのindex番号をposに代入. 0から開始
pos = 0
K.downto(1) do |i|
  26.times do |j|
    # ("a".ord + j).chr のSでのindexをnext_posに代入
    next_pos = nex[pos][j]
    # next_posの位置の文字を選択した時、残り文字数が足りているか確認
    next if N - next_pos < i
    ans << S[next_pos]
    pos = next_pos + 1
    break
  end
end


puts ans
