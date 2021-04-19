# https://atcoder.jp/contests/abc037/tasks/abc037_c

class ABC037C
  attr_reader :n, :k, :a

  def initialize
    @n, @k = gets.split(" ").map(&:to_i)
    @a = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve3
  end

  # Wrong
  def solve
    sum = 0
    r = n - k + 1

    return a.sum if r == 1

    a.each_with_index do |ai, i|
      if i + 1 < r
        #puts "A) a[#{i}] = #{ai} (x#{i + 1})"
        sum += ai * (i + 1)
      elsif n - i < r
        #puts "B) a[#{i}] = #{ai} (x#{n - i})"
        sum += ai * (n - i)
      else
        #puts "C) a[#{i}] = #{ai} (x#{k})"
        sum += ai * [k, r].min
      end
    end

    sum
  end

  def solve2
    sum = 0

    r = n - k + 1

    r.times do |i|
      sum += a[i...(i + k)].sum
    end

    sum
  end

  def solve3
    sub_sum = a[0...k].sum
    sum = sub_sum

    r = n - k + 1

    (r - 1).times do |i|
      sub_sum -= a[i]
      sub_sum += a[i + k]
      sum += sub_sum
    end

    sum
  end
end

ABC037C.new.run

__END__
=input
5 3
1 2 4 8 16
=expect
49
=input
20 10
100000000 100000000 98667799 100000000 100000000 100000000 100000000 99986657 100000000 100000000 100000000 100000000 100000000 98995577 100000000 100000000 99999876 100000000 100000000 99999999
=expect
10988865195
=input
6 3
1 2 3 4 5 6
=expect
42
=input
3 3
1 2 3
=expect
6
=input
6 5
1 2 3 4 5 6
=expect
35
