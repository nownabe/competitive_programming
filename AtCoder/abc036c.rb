# https://atcoder.jp/contests/abc036/tasks/abc036_c

class ABC036C
  attr_reader :n, :as

  def initialize
    @n = gets.to_i
    @as = []
    @n.times { @as << gets.to_i }
  end

  def run
    puts solve
  end

  def solve
    values = Hash.new { |h, k| h[k] = [] }

    as.each_with_index do |a, i|
      values[a] << i
    end

    bs = Array.new(n)

    values.keys.sort.each_with_index do |a, b|
      values[a].each { |i| bs[i] = b }
    end

    bs
  end
end

ABC036C.new.run

__END__
=input
5
3
3
1
6
1
=expect
1
1
0
2
0
