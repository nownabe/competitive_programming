# https://atcoder.jp/contests/abc028/tasks/abc028_a

class ABC028A
  attr_reader :n

  def initialize
    @n = gets.to_i
  end

  def run
    puts solve
  end

  def solve
    if n <= 59
      "Bad"
    elsif n <= 89
      "Good"
    elsif n <= 99
      "Great"
    else
      "Perfect"
    end
  end
end

ABC028A.new.run

__END__
=input
80
=expect
Good
=input
100
=expect
Perfect
=input
59
=expect
Bad
=input
95
=expect
Great
