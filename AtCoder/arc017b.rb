# https://atcoder.jp/contests/arc017/tasks/arc017_2

class ARC017B
  attr_reader :n, :k, :as

  def initialize
    @n, @k = gets.split(" ").map(&:to_i)
    @as = []
    @n.times { @as << gets.to_i }
  end

  def run
    puts solve
  end

  def solve
    # return 1 if as.size == 1 && k == 1

    count = 0
    prev = 300_001
    seq_count = 0

    as.each do |a|
      if a > prev
        seq_count += 1
      else
        seq_count = 1
      end

      if seq_count >= k
        count += 1
      end
      # puts "#{a}: prev=#{prev}, seq_count=#{seq_count}, count=#{count}"

      prev = a
    end

    count
  end
end

ARC017B.new.run

__END__
=input
10 4
100
300
600
700
800
400
500
800
900
900
=expect
3
=input
10 3
10
40
50
80
90
30
20
40
90
95
=expect
5
=input
8 4
1
2
3
4
5
6
7
8
=expect
5
=input
8 2
100000
90000
50000
30000
10000
4000
200
1
=expect
0
