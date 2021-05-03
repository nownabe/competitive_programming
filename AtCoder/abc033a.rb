# https://atcoder.jp/contests/abc033/tasks/abc033_a

class ABC033A
  attr_reader

  def initialize
    @n = gets.chomp
  end

  def run
    if solve
      puts "SAME"
    else
      puts "DIFFERENT"
    end
  end

  def solve
    @n.chars.uniq.size == 1
  end
end

ABC033A.new.run

__END__
=input
2222
=expect
SAME
=input
1221
=expect
DIFFERENT
=input
0000
=expect
SAME
