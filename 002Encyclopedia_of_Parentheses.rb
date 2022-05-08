# 002 - Encyclopedia of Parentheses（★3）
# bit全探索
# 正しい括弧列の条件

N = gets.to_i

# 正しい括弧か判定
def bracket?(arg)
  return false if arg.size & 1 == 1 # 括弧の数が奇数ならfalse
  left = 0 # 常に"("が")"より多いことを利用
  arg.each do |b|
    b == "(" ? left += 1 : left -= 1
    break if left < 0
  end
  left == 0
end

ans = %w[( )].repeated_permutation(N).reduce([]) do |brackets, arg|
  bracket?(arg) ? brackets << arg.join : brackets
end

puts ans
