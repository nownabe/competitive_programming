# https://atcoder.jp/contests/abc160/tasks/abc160_e

class ABC160E
  attr_reader

  def initialize
    @x, @y, @a, @b, @c = gets.split(" ").map(&:to_i)
    @reds = gets.split(" ").map(&:to_i)
    @greens = gets.split(" ").map(&:to_i)
    @whites = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    reds = @reds.sort[(@a - @x)..-1]
    greens = @greens.sort[(@b - @y)..-1]
    whites = @whites.sort

    red_i = 0
    green_i = 0
    white_i = whites.size - 1

    loop do
      break if white_i < 0
      break if red_i >= reds.size && green_i >= greens.size

      if red_i < reds.size && green_i < greens.size
        break if whites[white_i] <= [reds[red_i], greens[green_i]].min

        if reds[red_i] <= greens[green_i]
          if reds[red_i] < whites[white_i]
            reds[red_i] = whites[white_i]
            red_i += 1
            white_i -= 1
          end
        else
          if greens[green_i] < whites[white_i]
            greens[green_i] = whites[white_i]
            green_i += 1
            white_i -= 1
          end
        end
      elsif red_i < reds.size
        if reds[red_i] < whites[white_i]
          reds[red_i] = whites[white_i]
          red_i += 1
          white_i -= 1
        else
          break
        end
      elsif green_i < greens.size
        if greens[green_i] < whites[white_i]
          greens[green_i] = whites[white_i]
          green_i += 1
          white_i -= 1
        else
          break
        end
      end
    end

    reds.sum + greens.sum
  end
end

ABC160E.new.run

__END__
=input
1 2 2 2 1
2 4
5 1
3
=expect
12
=input
2 2 2 2 2
8 6
9 1
2 1
=expect
25
=input
2 2 4 4 4
11 12 13 14
21 22 23 24
1 2 3 4
=expect
74
