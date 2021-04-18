# https://atcoder.jp/contests/abc037/tasks/abc037_a

class ABC037A
  attr_reader :a, :b, :c

  def initialize
    @a, @b, @c = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    price = a > b ? b : a
    c / price
  end
end

ABC037A.new.run

__END__
=input
3 5 6
=expect
2
=input
8 6 20
=expect
3
