# https://atcoder.jp/contests/abc002/tasks/abc002_1

class ABC002A
  attr_reader

  def initialize
    @x, @y = gets.split(" ").map(&:to_i)
  end

  def run
    puts [@x, @y].max
  end

  def solve
  end
end

ABC002A.new.run

__END__
=input
10 11
=expect
11
=input
100000000 10000000
=expect
100000000
