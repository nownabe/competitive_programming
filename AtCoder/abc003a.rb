# https://atcoder.jp/contests/abc003/tasks/abc003_1

n = gets.to_i

sum = 0
n.times do |i|
  sum += (i + 1) / n.to_f
end

puts sum * 10000
