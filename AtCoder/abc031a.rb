# https://atcoder.jp/contests/abc031/tasks/abc031_a

class ABC031A
  attr_reader :a, :d

  def initialize
    @a, @d = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    if (a + 1) * d < a * (d + 1)
      a * (d + 1)
    else
      (a + 1) * d
    end
  end
end

ABC031A.new.run

__END__
=input
31 87
=expect
2784
=input
101 65
=expect
6666
=input
3 3
=expect
12
