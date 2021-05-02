#

require "set"

class ZONE2021C
  attr_reader

  def initialize
    @n = gets.to_i
    @abcde = []
    @n.times { @abcde << gets.split(" ").map(&:to_i) }
  end

  def run
    puts solve
  end

  def solve
    upper = 10 ** 9 + 1
    lower = 0

    while upper - lower > 1
      center = (upper + lower) / 2

      if satisfy?(center)
        lower = center
      else
        upper = center
      end
    end

    lower
  end

  def satisfy?(power)
    powers = Set.new

    @abcde.each do |abcde|
      powers << abcde.map.with_index { |p, i| p >= power ? 1 << i : 0 }.sum
    end

    powers.each do |x|
      powers.each do |y|
        powers.each do |z|
          return true if x | y | z == 31
        end
      end
    end

    false
  end
end

ZONE2021C.new.run

__END__
=input
3
3 9 6 4 6
6 9 3 1 1
8 8 9 3 7
=expect
4
=input
5
6 13 6 19 11
4 4 12 11 18
20 7 19 2 5
15 5 12 20 7
8 7 6 18 5
=expect
13
=input
10
6 7 5 18 2
3 8 1 6 3
7 2 8 7 7
6 3 3 4 7
12 8 9 15 9
9 8 6 1 10
12 9 7 8 2
10 3 17 4 10
3 1 3 19 3
3 14 7 13 1
=expect
10
