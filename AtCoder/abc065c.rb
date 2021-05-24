# https://atcoder.jp/contests/abc065/tasks/arc076_a

class ABC065C
  MOD = 10 ** 9 + 7
  attr_reader

  def initialize
    @n, @m = gets.split(" ").map(&:to_i)
    @factorial = []
  end

  def run
    puts solve
  end

  def solve
    lower = [@m, @n].min
    upper = [@m, @n].max

    fact = 1
    lower.times { |i| fact = (fact * (i + 1)) % MOD }

    if @n == @m
      (fact * fact * 2) % MOD
    elsif (@n - @m).abs == 1
      (fact * fact * upper) % MOD
    else
      0
    end
  end
end

ABC065C.new.run

__END__
=input
2 2
=expect
8
=input
3 2
=expect
12
=input
1 8
=expect
0
=input
100000 100000
=expect
530123477
