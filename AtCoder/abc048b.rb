# https://atcoder.jp/contests/abc048/tasks/abc048_b

def f(n, x)
  if n >= 0
    n / x + 1
  else
    0
  end
end

def solve(a, b, x)
  f(b, x) - f(a - 1, x)
end

a, b, x = gets.split(" ").map(&:to_i)

puts solve(a, b, x)

