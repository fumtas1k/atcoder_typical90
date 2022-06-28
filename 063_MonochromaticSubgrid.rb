# 063 - Monochromatic Subgrid（★4）
# bit全探索

H, W = gets.split.map(&:to_i)
P = Array.new(H) { gets.split.map(&:to_i) }

ans = 0
[true, false].repeated_permutation(H) do |bools|
  comb = P.select.with_index {|_, i| bools[i] }
  size = comb.size
  memo = Hash.new(0)

  comb.transpose.each do |arr|
    next unless arr.count(arr[0]) == size
    memo[arr[0]] += 1
  end

  next if memo.empty?
  ans = [ans, memo.values.max * size].max
end

puts ans
