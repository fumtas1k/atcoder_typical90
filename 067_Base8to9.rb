# 067 - Base 8 to 9（★2）
# N進法展開

N, K = gets.chomp.split
puts K.to_i.times.reduce(N) {|n, _| n.to_i(8).to_s(9).gsub("8", "5") }


# rubyのメソッドを極力使わずに解凍した場合
n, k = gets.chomp.split
k = k.to_i

# 8進数を10進数に変換
def base8_to_long(str)
  str.chars.reduce(0) {|ans, c| ans * 8 + c.to_i }
end

# 10進数を9進数の文字列に変換
def long_to_base9(num)
  return num.to_s if num == 0
  ans = []
  while num > 0
    ans << num % 9
    num /= 9
  end
  ans.reverse.join
end

k.times do |i|
  n = long_to_base9(base8_to_long(n))
  n.size.times do |i|
    n[i] = "5" if n[i] == "8"
  end
end

puts n
