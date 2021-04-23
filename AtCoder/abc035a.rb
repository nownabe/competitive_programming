# https://atcoder.jp/contests/abc035/tasks/abc035_a

class ABC035A
  attr_reader :w, :h

  def initialize
    @w, @h = gets.split(" ").map(&:to_i)
  end

  def run
    if w.to_f / h == 4.0 / 3.0
      puts "4:3"
    else
      puts "16:9"
    end
  end

  def solve
  end
end

ABC035A.new.run

__END__
=input
4 3
=expect
4:3
=input
16 9
=expect
16:9
=input
28 21
=expect
4:3
