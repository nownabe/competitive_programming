# https://atcoder.jp/contests/abc034/tasks/abc034_b

class ABC034B
  attr_reader

  def initialize
    @n = gets.to_i
  end

  def run
    if @n % 2 == 0
      puts @n - 1
    else
      puts @n + 1
    end
  end

  def solve
  end
end

ABC034B.new.run

__END__
=input
100
=expect
99
=input
123456789
=expect
123456790
