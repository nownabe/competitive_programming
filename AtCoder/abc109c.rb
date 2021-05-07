# https://atcoder.jp/contests/abc109/tasks/abc109_c

class ABC109C
  attr_reader :n, :initial_x, :xs

  def initialize
    @n, @initial_x = gets.split(" ").map(&:to_i)
    @xs = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    distances = @xs.map { |x| (x - initial_x).abs }
    distances.reduce(&:gcd)
  end
end

ABC109C.new.run

__END__
=input
3 3
1 7 11
=expect
2
=input
3 81
33 105 57
=expect
24
=input
1 1
1000000000
=expect
999999999
