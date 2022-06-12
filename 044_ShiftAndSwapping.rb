# 044 - Shift and Swapping
# みかけ上の変化をメモ

N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
TXY = Array.new(Q) { gets.split.map(&:to_i) }
shift = 0
ans = []
TXY.each do |t, x, y|
  c_x = (x - 1 - shift) % N
  c_y = (y - 1 - shift) % N
  case t
  when 1
    A[c_x], A[c_y] = A[c_y], A[c_x]
  when 2
    shift += 1
  when 3
    ans << A[c_x]
  end
end

puts ans
