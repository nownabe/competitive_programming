# https://atcoder.jp/contests/abc026/tasks/abc026_a

class ABC026A
  attr_reader

  def initialize
    @a = gets.to_i
  end

  def run
    puts (@a / 2) * (@a - @a / 2)
  end

  def solve
  end
end

ABC026A.new.run

__END__
=input
10
=expect
25
=input
60
=expect
900
