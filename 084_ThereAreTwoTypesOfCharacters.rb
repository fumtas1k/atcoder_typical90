# 084 - There are two types of characters（★3）
# 累積, ラングレス圧縮, 余事象

# ラングレス圧縮, 余事象
N = gets.to_i
S = gets.chomp.chars

ans = N * (N + 1) / 2
cnt = 1
(1..N).each do |i|
  if i == N || S[i - 1] != S[i]
    ans -= cnt * (cnt + 1) / 2
    cnt = 1
  else
    cnt += 1
  end
end

puts ans

# 累積
N = gets.to_i
S = gets.chomp.chars

O, X = [0], [0]

(1..N).each do |i|
  if S[i - 1] == "o"
    O[i] = i
    X[i] = X[i - 1]
  else
    O[i] = O[i - 1]
    X[i] = i
  end
end

puts (1..N).reduce(0) {|sum, i| sum + [O[i], X[i]].min }
