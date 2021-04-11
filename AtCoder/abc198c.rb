# https://atcoder.jp/contests/abc198/tasks/abc198_c

class C
  attr_reader :r, :x, :y

  def initialize
    @r, @x, @y = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    distance = Math.sqrt(x ** 2 + y ** 2)

    if distance < r
      2
    elsif distance % r == 0
      (distance / r).to_i
    else
      (distance / r).to_i + 1
    end
  end
end

C.new.run
