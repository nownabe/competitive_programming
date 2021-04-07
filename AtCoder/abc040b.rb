# https://atcoder.jp/contests/abc040/tasks/abc040_b

n = gets.to_i

max_length = Math.sqrt(n).floor

min = 100000

max_length.times do |i|
  i = i + 1

  other = n / i

  diff = other - i
  rest = n - i * other

  min = diff + rest if diff + rest < min
end

puts min
