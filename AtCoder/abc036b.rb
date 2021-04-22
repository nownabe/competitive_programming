# https://atcoder.jp/contests/abc036/tasks/abc036_b

class ABC036B
  attr_reader :n, :grid

  def initialize
    @n = gets.to_i
    @grid = []
    @n.times { @grid << gets.chomp.chars }
  end

  def run
    n.times do |i|
      n.times do |j|
        print grid[n - j - 1][i]
      end
      puts
    end
  end

  def solve
  end
end

ABC036B.new.run

__END__
=input
4
ooxx
xoox
xxxx
xxxx
=expect
xxxo
xxoo
xxox
xxxx
