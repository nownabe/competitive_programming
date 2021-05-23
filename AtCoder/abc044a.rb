# https://atcoder.jp/contests/abc044/tasks/abc044_a

n = gets.to_i
k = gets.to_i
x = gets.to_i
y = gets.to_i

if n > k
  puts x * k + y * (n - k)
else
  puts x * n
end

