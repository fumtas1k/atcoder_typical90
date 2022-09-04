# 080 - Let's Share Bit（★6）
# 包除原理, bit全探索

N, D = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

# 包除原理を使うため、初期値は全ての場合の数
ans = 1 << D
(1..N).each do |i|
  A.combination(i) do |comb|
    # 論理和で得られた0の部分は1,0どちらでも良い
    bit = comb.reduce(:|)
    free_digits = D - bit.to_s(2).count("1")
    # 条件を満たさないものを引くが、重複して引くことになる
    # このため奇数個の組み合わせを引いて、偶数個の組み合わせを足す
    if i[0] == 0
      ans += 1 << free_digits
    else
      ans -= 1 << free_digits
    end
  end
end

puts ans
