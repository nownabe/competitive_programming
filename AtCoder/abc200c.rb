#

class ABC200C
  attr_reader

  def initialize
    @n = gets.to_i
    @as = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve3
  end

  # Editorial
  def solve3
    count = Hash.new { |h, k| h[k] = 0 }
    @as.each { |a| count[a % 200] += 1 }

    count.values.map { |v| (v * (v - 1)) / 2 }.sum
  end

  # AC
  def solve2
    count = 0

    while @as.length > 0
      a = @as[0]
      next_as = @as[1..-1].select { |aj| (a - aj) % 200 != 0 }
      diff = @as.length - next_as.length - 1
      count += (diff * (diff + 1)) / 2
      @as = next_as
    end

    count
  end

  # TLE
  def solve
    count = 0
    plus = Array.new(@n) { 1 }

    @as.each_with_index do |ai, i|
      (i + 1).step(@as.length - 1) do |j|
        if (ai - @as[j]) % 200 == 0
          count += plus[i]
          plus[j] = plus[i] + 1
          break
        end
      end
    end

    count
  end
end

ABC200C.new.run

__END__
=input
6
123 223 123 523 200 2000
=expect
4
=input
5
1 2 3 4 5
=expect
0
=input
8
199 100 200 400 300 500 600 200
=expect
9
