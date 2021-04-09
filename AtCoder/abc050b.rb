# https://atcoder.jp/contests/abc050/tasks/abc050_b

n = gets.to_i
t = gets.split(" ").map(&:to_i)
m = gets.to_i

sum = t.sum

m.times do
  p, x = gets.split(" ").map(&:to_i)

  if t[p - 1] > x
    puts sum - (t[p - 1] - x)
  else
    puts sum + (x - t[p - 1])
  end
end
