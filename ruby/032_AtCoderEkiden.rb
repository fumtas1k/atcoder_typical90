# 032 - AtCoder Ekiden（★3）
# 順列全探索

N = gets.to_i
A = Array.new(N) { gets.split.map(&:to_i) }
M = gets.to_i
hate = Array.new(N) { [] }
M.times do
  x, y = gets.split.map { _1.to_i - 1 }
  hate[x][y] = hate[y][x] = true
end

ans = 10 ** 18
[*0...N].permutation do |nums|
  sum = A[nums[0]][0]
  i = 1
  while i < N
    pre, cur = nums[i - 1], nums[i]
    break if hate[pre][cur]
    sum += A[cur][i]
    i += 1
  end
  ans = [sum, ans].min if i == N
end

puts ans == 10 ** 18 ? -1 : ans
