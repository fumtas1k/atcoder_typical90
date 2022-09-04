# 001 - Yokan Party（★4）
# 貪欲法
# 二分探索法

N, L = gets.split.map(&:to_i)
K = gets.to_i
A = gets.split.map(&:to_i)

# k+1個のピースのうち最も短いものの長さ(size)を求める
# を言い換えると、
# ようかんを全てsize以上の長さで切断した時、k+1個以上に切断ができるか
# 貪欲法でチェック
def cuttable?(size)
  cuts = [0]
  A.each do |a|
    # a - pre >= size && L - a >= size の書き換え
    cuts << a if a.between?(cuts[-1] + size, L - size)
  end
  # 初期値に入れた0はカウントしないため、その分を引く
  cuts.size - 1 >= K

end

# 最大のスコアを求めるため、二分探索法を使用(bsearchではTLEになる)
left, right = -1, L + 1
while right - left > 1
  mid = (left + right) / 2
  cuttable?(mid) ? left = mid : right = mid
end

puts left
