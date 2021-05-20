# https://atcoder.jp/contests/agc011/tasks/agc011_b

class AGC011B
  attr_reader

  def initialize
    @n = gets.to_i
    @as = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    count = 0

    sorted = @as.sort
    sum = 0

    (@n - 1).times do |i|
      sum += sorted[i]
      if sum * 2 >= sorted[i + 1]
        count += 1
      else
        count = 0
      end
    end

    count + 1
  end
end

AGC011B.new.run

__END__
=input
3
3 1 4
=expect
2
=input
5
1 1 1 1 1
=expect
5
=input
6
40 1 30 2 7 20
=expect
4
