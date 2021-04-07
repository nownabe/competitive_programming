# https://atcoder.jp/contests/abc040/tasks/abc040_a

n, x = gets.split(" ").map(&:to_i)

if x <= n / 2
  puts x - 1
else
  puts n - x
end
