# https://atcoder.jp/contests/abc041/tasks/abc041_b

a, b, c = gets.split(" ").map(&:to_i)

# puts (a * b * c) % (10 ** 9 + 7)

m = 10 ** 9 + 7
puts (((a * b) % m) * (c % m)) % m
