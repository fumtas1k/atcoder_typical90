# 034 - There are few types of elements（★4）
# 尺取法

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

memo = Hash.new(0)
ans = cnt = right = 0

N.times do |left|
  while right < N
    a = A[right]
    break if memo[a] == 0 && cnt == K
    cnt += 1 if memo[a] == 0
    memo[a] += 1
    right += 1
  end
  ans = [ans, right - left].max
  cnt -= 1 if memo[A[left]] == 1
  memo[A[left]] -= 1
  right = [right, left + 1].max
end

puts ans
