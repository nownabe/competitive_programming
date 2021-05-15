#
# gets.split(" ").map(&:to_i)

n = gets.to_i

mountains = []
n.times do
  s, t = gets.split(" ")
  mountains << [s, t.to_i]
end

mountains.sort! { |a, b| b[1] <=> a[1] }
puts mountains[1][0]

__END__
=input
=expect
=input
=expect
=input
=expect
=input
=expect
