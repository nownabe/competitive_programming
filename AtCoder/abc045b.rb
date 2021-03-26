# https://atcoder.jp/contests/abc045/tasks/abc045_b

s = {}

s["a"] = gets.chomp
s["b"] = gets.chomp
s["c"] = gets.chomp

turn = "a"

loop do
  break if s[turn].empty?

  next_turn = s[turn][0]
  s[turn] = s[turn][1..-1]
  turn = next_turn
end

puts turn.upcase
