#
# gets.split(" ").map(&:to_i)
a1, a2, a3 = gets.split(" ").map(&:to_i)

# a1, a2, a3
# a1, a3, a2
# a2, a1, a3
# a2, a3, a1
#

[a1, a2, a3].permutation.each do |a1, a2, a3|
  if a3 - a2 == a2 - a1
    puts "Yes"
    exit
  end
end

puts "No"
