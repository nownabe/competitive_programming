# https://atcoder.jp/contests/abc044/tasks/arc060_a

class Solver
  def initialize(a, x)
    @a = a
    @x = x
    @n = x.length
  end

  def solve
    count = 0

    (1 << @n).times do |i|
      chosen = []
      @n.times do |j|
        chosen << @x[j] if (1 << j & i) != 0
      end
      count += 1 if @a == chosen.sum / chosen.length.to_f
    end

    count
  end

  def solve2
    @y = @x.map { |x| x - @a }

    dp = Array.new(@n + 1) { Array.new(2500 * 2) { 0 } }
    dp[0][2500] = 1

    @n.times do |i|
      5000.times do |s|
        next if s + @y[i] >= 5000 || s + @y[i] < 0

        dp[i + 1][s] += dp[i][s]
        dp[i + 1][s + @y[i]] += dp[i][s]
      end
    end

    dp[@n][2500] - 1
  end
end

_, a = gets.split(" ").map(&:to_i)
x = gets.split(" ").map(&:to_i)

puts Solver.new(a, x).solve2
