# https://atcoder.jp/contests/abc037/tasks/abc037_b

class ABC037B
  attr_reader :n, :q, :operations

  def initialize
    @n, @q = gets.split(" ").map(&:to_i)
    @operations = []
    @q.times { @operations << gets.split(" ").map(&:to_i) }
  end

  def run
    puts solve
  end

  def solve
    arr = Array.new(n) { 0 }

    operations.each do |l, r, t|
      l.step(r) do |i|
        arr[i - 1] = t
      end
    end

    arr
  end
end

ABC037B.new.run

__END__
=input
5 2
1 3 10
2 4 20
=expect
10
20
20
20
0
=input
10 4
2 7 22
3 5 4
6 10 1
4 4 12
=expect
0
22
4
12
4
1
1
1
1
1
