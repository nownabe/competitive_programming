# https://atcoder.jp/contests/abc043/tasks/arc059_a

n = gets.to_i
a = gets.split(" ").map(&:to_i)

costs = Array.new(201) { [] }

a.each do |x|
  201.times do |j|
    y = j - 100
    costs[j] << (x - y) ** 2
  end
end

puts costs.map(&:sum).min
