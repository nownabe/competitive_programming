# https://atcoder.jp/contests/abc039/tasks/abc039_a

a, b, c = gets.split(" ").map(&:to_i)

puts (a * b + b * c + c * a) * 2
