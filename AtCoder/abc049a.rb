# https://atcoder.jp/contests/abc049/tasks/abc049_a

c = gets.chomp

if %w(a e i o u).include?(c)
  puts "vowel"
else
  puts "consonant"
end
