# https://atcoder.jp/contests/abc043/tasks/abc043_b

s = gets.chomp

output = +""

s.chars.each do |c|
  case c
  when "0" then output << "0"
  when "1" then output << "1"
  when "B" then output = output[0..-2]
  end
end

puts output
