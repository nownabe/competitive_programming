# https://atcoder.jp/contests/abc038/tasks/abc038_c

class ABC038C
  attr_reader :n, :a

  def initialize
    @n = gets.to_i
    @a = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    count = 0

    left = 0
    prev = 1000000
    a.each_with_index do |ai, i|
      if ai <= prev
        n = i - left
        count += n * (n + 1) / 2
        left = i
      end

      prev = ai
    end

    n = a.length - left
    count += n * (n + 1) / 2

    count
  end
end

ABC038C.new.run

__END__
=input
5
1 2 3 2 1
=expect
8
=input
4
1 2 3 4
=expect
10
=input
6
3 3 4 1 2 2
=expect
8
=input
6
1 5 2 3 4 2
=expect
10
