# 063 - Monochromatic Subgrid（★4）
# bit全探索

H, W = gets.split.map(&:to_i)
P = Array.new(H) { gets.split.map(&:to_i) }

ans = []
[true, false].repeated_permutation(H) do |bools|
  rows = P.select.with_index {|_, i| bools[i] }
  size = rows.size
  cnt = Hash.new(0)

  rows.transpose.each do |row|
    next unless row.all?(row[0])
    cnt[row[0]] += 1
  end

  next if cnt.empty?
  ans << cnt.values.max * size
end

puts ans.max
