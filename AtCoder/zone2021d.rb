# https://atcoder.jp/contests/zone2021/tasks/zone2021_d

class ZONE2021D
  attr_reader

  def initialize
    @s = gets.chomp
  end

  def run
    puts solve
  end

  def solve
    t_chars = []
    reversed = false
    @s.chars.each do |c|
      if c == "R"
        reversed = !reversed
      elsif reversed
        if t_chars[0] == c
          t_chars.shift
        else
          t_chars.unshift(c)
        end
      else
        if t_chars[-1] == c
          t_chars.pop
        else
          t_chars.push(c)
        end
      end
    end

    if reversed
      t_chars.reverse.join
    else
      t_chars.join
    end
  end
end

ZONE2021D.new.run

__END__
=input
ozRnonnoe
=expect
zone
=input
hellospaceRhellospace
=expect

