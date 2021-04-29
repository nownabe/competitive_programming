# https://atcoder.jp/contests/arc116/tasks/arc116_a

class ARC116A
  attr_reader

  def initialize
    @t = gets.to_i
    @cases = []
    @t.times { @cases << gets.to_i }
  end

  def run
    puts solve
  end

  def solve
    @cases.map { |c| solve_case2(c) }
  end

  def solve_case2(n)
    return "Odd" if n % 2 != 0
    return "Even" if n % 4 == 0
    "Same"
  end

  def solve_case(n)
    return "Odd" if n % 2 != 0

    odd = 0
    even = 0

    1.step(Math.sqrt(n).floor) do |i|
      next if n % i != 0

      if i % 2 == 0
        even += 1
      else
        odd += 1
      end

      next if n / i == i

      if (n / i) % 2 == 0
        even += 1
      else
        odd += 1
      end
    end

    if odd == even
      "Same"
    elsif odd > even
      "Odd"
    else
      "Even"
    end
  end
end

ARC116A.new.run

__END__
=input
3
2
998244353
1000000000000000000
=expect
Same
Odd
Even
