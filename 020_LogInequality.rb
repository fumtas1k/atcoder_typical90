# 020 - Log Inequality（★3）
# 整数

a, b, c = gets.split.map(&:to_i)
puts a < c.pow(b) ? "Yes" : "No"
# puts a < c ** b ? "Yes" : "No" # こっちでもOK

# こっちだと近似値になりWA
# puts Math.log(a, 2) < b * Math.log(c, 2) ? "Yes" : "No"
