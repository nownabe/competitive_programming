# frozen_string_literal: true

class AGC023A
  def initialize
    @n = gets.to_i
    @as = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve2
  end

  def solve2
    sum = 0
    sums = Hash.new { |h, k| h[k] = 0 }
    sums[0] = 1

    @as.each do |a|
      sum += a

      sums[sum] += 1
    end

    count = 0

    sums.each_value do |sum|
      if sum > 1
        count += sum.times.to_a.combination(2).size
      end
    end

    count
  end

  # TLE
  def solve
    count = 0
    prev_sums = Hash.new { |h, k| h[k] = 0 }

    @as.each do |a|
      #p prev_sums

      sums = Hash.new { |h, k| h[k] = 0 }

      prev_sums.each { |sum, cnt| sums[sum + a] = cnt }
      sums[a] += 1

      count += sums[0] if sums.key?(0)

      prev_sums = sums
    end

    count
  end
end

AGC023A.new.run

__END__
=input
6
1 3 -4 2 2 -2
=expect
3
=input
7
1 -1 1 -1 1 -1 1
=expect
12
=input
5
1 -2 3 -4 5
=expect
0
