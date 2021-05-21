# https://atcoder.jp/contests/abc173/tasks/abc173_d

class ABC173D
  attr_reader

  def initialize
    @n = gets.to_i
    @as = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    sorted = @as.sort { |a, b| b <=> a }

    return sorted[0] if @n == 2

    sum = sorted[0]

    2.step(sorted.size - 1) do |i|
      sum += sorted[i/2]
    end

    sum
  end
end

ABC173D.new.run

__END__
=input
4
2 2 1 3
=expect
7
=input
7
1 1 1 1 1 1 1
=expect
6
