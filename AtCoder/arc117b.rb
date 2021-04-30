# https://atcoder.jp/contests/arc117/tasks/arc117_b

class ARC117B
  attr_reader :n, :a

  def initialize
    @n = gets.to_i
    @a = gets.split(" ").map(&:to_i)
  end

  def run
    b = [0] + a.sort
    sum = 1
    mod = 10 ** 9 + 7
    n.times do |i|
      sum *= (b[i + 1] - b[i] + 1)
      sum %= mod
    end
    puts sum % mod
  end

  def solve
  end
end

ARC117B.new.run

__END__
=input
2
1 2
=expect
4
=input
6
5 3 4 1 5 2
=expect
32
=input
7
314 159 265 358 979 323 846
=expect
492018656
