# https://atcoder.jp/contests/abc050/tasks/abc050_a

a, op, b = gets.chomp.split(" ")

if op == "+"
  puts a.to_i + b.to_i
else
  puts a.to_i - b.to_i
end
