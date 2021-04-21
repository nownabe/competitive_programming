# https://atcoder.jp/contests/abc036/tasks/abc036_a

class ABC036A
  attr_reader :a, :b

  def initialize
    @a, @b = gets.split(" ").map(&:to_i)
  end

  def run
    puts (b.to_f / a).ceil
  end

  def solve
  end
end

ABC036A.new.run

__END__
=input
12 36
=expect
3
=input
12 100
=expect
9
