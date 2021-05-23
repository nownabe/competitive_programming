# https://atcoder.jp/contests/abc044/tasks/abc044_b

w = gets.chomp

counter = Hash.new(0)

w.chars.each { |c| counter[c] += 1 }

if counter.values.all? { |v| v % 2 == 0 }
  puts "Yes"
else
  puts "No"
end
