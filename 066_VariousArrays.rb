# 066 - Various Arrays（★5）
# 期待値の線形性

N = gets.to_i
LR = Array.new(N) { gets.split.map(&:to_i) }

exp_sum = 0.0
(N - 1).times do |i|
  li, ri = LR[i]
  (i + 1...N).each do |j|
    lj, rj = LR[j]
    all = (ri - li + 1) * (rj - lj + 1)
    # i < j && Xi > Xjである数
    cnt = (li..ri).reduce(0) do |sum, k|
      rj_max = [k - 1, rj].min
      # rj_max - lj + 1が0以下の場合に備えて
      sum + [rj_max - lj + 1, 0].max
    end
    exp_sum += cnt / all.to_f
  end
end

puts exp_sum
