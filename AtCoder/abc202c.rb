# https://atcoder.jp/contests/abc202/tasks/abc202_c

class ABC202C
  attr_reader

  def initialize
    @n = gets.to_i
    @as = gets.split(" ").map(&:to_i)
    @bs = gets.split(" ").map(&:to_i)
    @cs = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    count = 0

    h = Hash.new { |h, k| h[k] = [] }
    @as.each_with_index { |a, i| h[a] << i }

    ch = Hash.new { |h, k| h[k] = [] }
    @cs.each_with_index { |c, i| ch[c - 1] << i }

    @bs.each_with_index do |b, i|
      next unless h.key?(b)
      next unless ch.key?(i)

      count += h[b].size * ch[i].size
    end

    count
  end
end

ABC202C.new.run

__END__
=input
3
1 2 2
3 1 2
2 3 2
=expect
4
=input
4
1 1 1 1
1 1 1 1
1 2 3 4
=expect
16
=input
3
2 3 3
1 3 3
1 1 1
=expect
0
