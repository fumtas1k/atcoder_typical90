# 016 - Minimum Coins（★3）
# 工夫した全探索

N = gets.to_i
A, B, C = gets.split.map(&:to_i).sort.reverse

# 制約よりコインの枚数は最大でも9999。
# 最小枚数を求めるため、ループはans以下で繰り返す
# 外側ループはAよりBの方が速い
ans = 9999
[N / B, ans].min.downto(0) do |b|
  [(N - B * b) / A, ans - b].min.downto(0) do |a|
    c, remain = (N - (A * a + B * b)).divmod(C)
    sum = a + b + c
    if remain.zero?
      ans = [ans, sum].min
      break
    # ansを超える場合はループを打ち切る
    # sum > ansだとTLEする（sum + 1 >= ansの方が速い）
    elsif sum + 1 >= ans
      break
    end
  end
end

puts ans
