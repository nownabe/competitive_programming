# https://atcoder.jp/contests/abc202/tasks/abc202_b

s = gets.chomp

s2 = s.reverse.chars.map do |c|
  if c == "6"
    "9"
  elsif c == "9"
    "6"
  else
    c
  end
end.join

puts s2
