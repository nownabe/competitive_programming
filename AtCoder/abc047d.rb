# https://atcoder.jp/contests/abc047/tasks/arc063_b

class Solver
  def initialize(n, t, a)
    @n = n
    @t = t
    @a = a
  end

  def solve
    max_count = 0
    max = 0

    @n.times do |i|
      (i + 1).step(@n - 1) do |j|
        d = @a[j] - @a[i]
        if d == max
          max_count += 1
        elsif d > max
          max = d
          max_count = 1
        end
      end
    end

    max_count
  end

  def solve2
    count = 0
    min = 10 ** 9 + 1
    diff = 0

    @a.each_with_index do |a, i|
      if a - min == diff
        count += 1
      elsif a - min > diff
        count = 1
        diff = a - min
      end

      min = a if a < min
    end

    count
  end
end

n, t = gets.split(" ").map(&:to_i)
a = gets.split(" ").map(&:to_i)

puts Solver.new(n, t, a).solve2
