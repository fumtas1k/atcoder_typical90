# 034 - There are few types of elements（★4）
# 尺取法

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

use_cnt = Hash.new(0)
ans = cnt = right = 0

N.times do |left|
  while right < N
    a = A[right]
    if use_cnt[a] == 0
      break if cnt == K
      cnt += 1
    end

    use_cnt[a] += 1
    right += 1
  end
  ans = [ans, right - left].max
  use_cnt[A[left]] -= 1
  cnt -= 1 if use_cnt[A[left]] == 0
end

puts ans
