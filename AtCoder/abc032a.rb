# https://atcoder.jp/contests/abc032/tasks/abc032_a

class ABC032A
  attr_reader

  def initialize
    @a = gets.to_i
    @b = gets.to_i
    @n = gets.to_i
  end

  def run
    puts solve
  end

  def solve
    lcm = @a.lcm(@b)
    lcm * (@n.to_f / lcm).ceil
  end
end

ABC032A.new.run

__END__
=input
2
3
8
=expect
12
=input
2
2
2
=expect
2
=input
12
8
25
=expect
48
