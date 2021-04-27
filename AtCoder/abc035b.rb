# https://atcoder.jp/contests/abc035/tasks/abc035_b

class ABC035B
  attr_reader :s, :t

  def initialize
    @s = gets.chomp
    @t = gets.to_i
  end

  def run
    max, min = solve
    if @t == 1
      puts max
    else
      puts min
    end
  end

  COMMAND = {
    "L" => [-1, 0],
    "R" => [1, 0],
    "U" => [0, 1],
    "D" => [0, -1],
  }

  def solve
    x, y = 0, 0
    unknown = 0

    s.chars.each do |command|
      if COMMAND.key?(command)
        dx, dy = COMMAND[command]
        x, y = x + dx, y + dy
      else
        unknown += 1
      end
    end

    distance = x.abs + y.abs

    min = if distance > unknown
        distance - unknown
      elsif (unknown - distance) % 2 == 0
        0
      else
        1
      end

    [distance + unknown, min]
  end
end

ABC035B.new.run

__END__
=input
UL?
1
=expect
3
=input
UD?
1
=expect
1
=input
UUUU?DDR?LLLL
1
=expect
7
=input
UULL?
2
=expect
3
