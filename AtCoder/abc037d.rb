# https://atcoder.jp/contests/abc037/tasks/abc037_d

class ABC037D
  DIRECTIONS = [[-1, 0], [0, -1], [1, 0], [0, 1]]
  M = 10 ** 9 + 7

  attr_reader :h, :w, :grid

  def initialize
    @h, @w = gets.split(" ").map(&:to_i)
    @grid = []
    @h.times { @grid << gets.split(" ").map(&:to_i) }
  end

  def run
    puts solve
  end

  def solve
    @dp = Array.new(h) { Array.new(w) { nil } }

    sum = 0

    h.times do |i|
      w.times do |j|
        sum += count(i, j)
      end
    end

    sum % M
  end

  def count(i, j)
    return @dp[i][j] if @dp[i][j]

    c = 1

    DIRECTIONS.each do |di, dj|
      ni = i + di
      nj = j + dj

      next if ni < 0 || ni >= h
      next if nj < 0 || nj >= w
      next if grid[ni][nj] <= grid[i][j]

      c += count(ni, nj)
    end

    @dp[i][j] = c % M
  end
end

ABC037D.new.run

__END__
=input
2 3
1 4 5
2 4 9
=expect
18
=input
6 6
1 3 4 6 7 5
1 2 4 8 8 7
2 7 9 2 7 2
9 4 2 7 6 5
2 8 4 6 7 6
3 7 9 1 2 7
=expect
170
