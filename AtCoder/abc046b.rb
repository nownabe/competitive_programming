# https://atcoder.jp/contests/abc046/tasks/abc046_b

n, k = gets.split(" ").map(&:to_i)

count = k

(n - 1).times { count *= (k - 1) }

puts count
