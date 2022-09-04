# 076 - Cake Cut（★3）
# 円環を列にして二倍にする(累積和), 尺取法

# 累積和
N = gets.to_i
A = gets.split.map(&:to_i)
csum = [*A, *A].reduce([0]) {|sum, a| sum << sum[-1] + a }

ans = "No"
if csum[N] % 10 == 0
  tenth_sum = csum[N] / 10
  N.times do |i|
    j = csum.bsearch_index { _1 - csum[i] >= tenth_sum }
    if j && csum[j] - csum[i] == tenth_sum
      ans = "Yes"
      break
    end
  end
end

puts ans

# 尺取法
N = gets.to_i
A = gets.split.map(&:to_i)

total_size = A.sum
ans = "No"

if total_size % 10 == 0
  tenth_size = total_size / 10
  j = size = 0
  N.times do |i|
    while j < i + N && size < tenth_size
      size += A[j % N]
      j += 1
    end
    if size == tenth_size
      ans = "Yes"
      break
    end
    size -= A[i]
  end
end

puts ans
