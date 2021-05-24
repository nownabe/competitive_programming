# https://atcoder.jp/contests/arc108/tasks/arc108_b

class ARC108B
  attr_reader

  def initialize
    @n = gets.to_i
    @s = gets.chomp
  end

  def run
    puts solve
  end

  # Editorial (TLE)
  def solve2
    t = ""
    @s.each_char do |c|
      t = "#{t}#{c}"
      t = t[0...-3] if t[-3..-1] == "fox"
    end
    t.length
  end

  # AC
  def solve
    s = @s.dup

    i = 0
    while i < s.length - 2
      if s[i...(i+3)] == "fox"
        s = "#{s[0...i]}#{s[(i+3)...s.length]}"
        i -= [2, i].min
      else
        i += 1
      end
    end

    s.length
  end
end

ARC108B.new.run

__END__
=input
6
icefox
=expect
3
=input
7
firebox
=expect
7
=input
48
ffoxoxuvgjyzmehmopfohrupffoxoxfofofoxffoxoxejffo
=expect
27
