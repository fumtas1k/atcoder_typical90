# 051 - Typical Shop（★5）
# 半分全列挙

def enumerate(arr)
  n = arr.size
  hash = Hash.new {|h, k| h[k] = [] }
  (1 << n).times do |bit|
    cnt = 0
    sum = 0
    n.times do |i|
      next if bit[i].zero?
      cnt += 1
      sum += arr[i]
    end
    hash[cnt] << sum
  end
  hash.each_value(&:sort!)
  hash
end

N, K, P = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

mid = N / 2
left = enumerate(A[0, mid])
right = enumerate(A[mid, N - mid])

ans = 0
left.each do |k1, l_sum|
  next if k1 > K
  l_sum.each do |v|
    next if v > P
    r_sum = right[K - k1]
    ans += r_sum.bsearch_index { _1 + v > P } || r_sum.size
  end
end

puts ans
