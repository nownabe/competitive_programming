# https://atcoder.jp/contests/abc027/tasks/abc027_a

class ABC027A
  attr_reader

  def initialize
    @ls = gets.split(" ").map(&:to_i)
  end

  def run
    count = Hash.new { |h, k| h[k] = 0 }
    @ls.each { |l| count[l] += 1 }
    count.each do |k, v|
      if v % 2 != 0
        puts k
        return
      end
    end
  end

  def solve
  end
end

ABC027A.new.run

__END__
=input
1 1 2
=expect
2
=input
4 3 4
=expect
3
=input
5 5 5
=expect
5
