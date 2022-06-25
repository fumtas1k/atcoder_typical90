# 061 - Deck（★2）
# deque

Q = gets.to_i
TX = Array.new(Q) { gets.split.map(&:to_i) }

# rubyデフォルト配列使用コード
cards, ans = [], []
TX.each do |t, x|
  case t
  when 1
    cards.unshift(x)
  when 2
    cards << x
  when 3
    ans << cards[x - 1]
  end
end

puts ans

# deque作成コード
deque, ans = [], []
cl = cr = 10 ** 5

TX.each do |t, x|
  case t
  when 1
    deque[cl - 1] = x
    cl -= 1
  when 2
    deque[cr] = x
    cr += 1
  when 3
    ans << deque[cl + x - 1]
  end
end

puts ans
