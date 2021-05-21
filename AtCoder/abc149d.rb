# https://atcoder.jp/contests/abc149/tasks/abc149_d

class ABC149D
  attr_reader

  def initialize
    @n, @k = gets.split(" ").map(&:to_i)
    @r, @s, @p = gets.split(" ").map(&:to_i)
    @t = gets.chomp.chars

    @points = {
      "r" => @r,
      "s" => @s,
      "p" => @p,
    }
  end

  def run
    puts solve
  end

  WIN_TE = {
    "r" => "p",
    "s" => "r",
    "p" => "s",
  }

  def solve
    total = 0
    selected = []

    @t.each_with_index do |t, i|
      win_te = WIN_TE[t]

      if i >= @k && selected[i - @k] == win_te
        if i + @k < @n
          next_win_te = WIN_TE[@t[i + @k]]
          te = WIN_TE.keys.find { |te| ![t, next_win_te].include?(te) }
          selected << te
        else
          te = WIN_TE.keys.find { |te| te != t }
          selected << te
        end
      else
        total += @points[win_te]
        selected << win_te
      end
    end

    total
  end
end

ABC149D.new.run

__END__
=input
5 2
8 7 6
rsrpr
=expect
27
=input
7 1
100 10 1
ssssppr
=expect
211
=input
30 5
325 234 123
rspsspspsrpspsppprpsprpssprpsr
=expect
4996
