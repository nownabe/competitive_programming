# https://atcoder.jp/contests/abc190/tasks/abc190_d

class ABC190D
  attr_reader

  def initialize
    @n = gets.to_i
  end

  def run
    puts solve3
  end

  # Editorial 2
  def solve3
    s = @n
    s /= 2 while s % 2 == 0

    s_r = Math.sqrt(s).to_i

    count = s_r.times.count { |i| s % (i + 1) == 0 } * 2
    count -= 1 if s_r * s_r == s
    count * 2
  end

  # Editorial
  def solve2
    count = 0

    s2 = @n * 2
    s_r = Math.sqrt(s2).to_i

    x = 1
    while x <= s_r
      if s2 % x == 0
        y = s2 / x
        if (x % 2 == 0 && y % 2 != 0) || (x % 2 != 0 && y % 2 == 0)
          count += x == y ? 1 : 2
        end
      end

      x += 1
    end

    count
  end

  # TLE
  def solve
    s = @n
    count = 0

    n = 0
    loop do
      n += 1

      break if n > s * 2

      next if (2 * s - n * n + n) % (2 * n) != 0

      count += 1
    end

    count
  end
end

ABC190D.new.run

__END__
=input
12
=expect
4
=input
1
=expect
2
=input
963761198400
=expect
1920
=input
32
=expect
2
