# https://atcoder.jp/contests/abc034/tasks/abc034_a

class ABC034A
  attr_reader :x, :y

  def initialize
    @x, @y = gets.split(" ").map(&:to_i)
  end

  def run
    if y > x
      puts "Better"
    else
      puts "Worse"
    end
  end

  def solve
  end
end

ABC034A.new.run

__END__
=input
12 34
=expect
Better
=input
98 56
=expect
Worse
