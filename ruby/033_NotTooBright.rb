# 033 - Not Too Bright（★2）

H, W = gets.split.map(&:to_i)

# i, jが共に奇数の場所に置くと良いが、
# 1 * W or H * 1の場合は全ての場所における
ans =
  if H == 1 || W == 1
    H * W
  else
    ((H + 1) / 2) * ((W + 1) / 2)
  end

puts ans
