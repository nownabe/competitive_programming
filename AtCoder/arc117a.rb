# https://atcoder.jp/contests/arc117/tasks/arc117_a

class ARC117A
  attr_reader :a, :b

  def initialize
    @a, @b = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve.join(" ")
  end

  def solve
    sequence = []

    if a == b
      a.times { |i| sequence << i + 1 }
      b.times { |i| sequence << -i - 1 }
    elsif a > b
      a.times { |i| sequence << i + 1 }
      sum = sequence.sum
      b_seq = []
      (b - 1).times { |i| b_seq << -i - 1 }
      sequence += b_seq
      sequence << -(sum + b_seq.sum)
    else
      b.times { |i| sequence << -i - 1 }
      sum = sequence.sum
      a_seq = []
      (a - 1).times { |i| a_seq << i + 1 }
      sequence += a_seq
      sequence << -sum - a_seq.sum
    end

    sequence
  end
end

ARC117A.new.run

__END__
=input
=expect
