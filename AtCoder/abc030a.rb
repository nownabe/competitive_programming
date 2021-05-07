# https://atcoder.jp/contests/abc030/tasks/abc030_a

class ABC030A
  attr_reader :a, :b, :c, :d

  def initialize
    @a, @b, @c, @d = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    takahashi = b.to_f / a
    aoki = d.to_f / c

    if takahashi > aoki
      "TAKAHASHI"
    elsif aoki > takahashi
      "AOKI"
    else
      "DRAW"
    end
  end
end

ABC030A.new.run

__END__
=input
5 2 6 3
=expect
AOKI
=input
100 80 100 73
=expect
TAKAHASHI
=input
66 30 55 25
=expect
DRAW
