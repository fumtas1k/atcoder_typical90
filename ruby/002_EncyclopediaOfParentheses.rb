# 002 - Encyclopedia of Parentheses（★3）
# bit全探索
# 正しい括弧列の条件

N = gets.to_i
exit if N & 1 == 1 # 括弧の数が奇数ならfalse

# 正しい括弧か判定
def bracket?(arg)
  cnt = 0 # 常に"("が")"より多いことを利用
  arg.each do |b|
    b == "(" ? cnt += 1 : cnt -= 1
    break if cnt < 0
  end
  cnt == 0
end

# bit全探索ではTLEとなるため、repeated_permutationで全探索
ans = %w[( )].repeated_permutation(N).reduce([]) do |brackets, arg|
  bracket?(arg) ? brackets << arg.join : brackets
end

puts ans
