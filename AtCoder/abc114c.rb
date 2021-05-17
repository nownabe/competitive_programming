# https://atcoder.jp/contests/abc114/tasks/abc114_c

class ABC114C
  attr_reader

  def initialize
    @n = gets.to_i
    @n_str = @n.to_s
    @n_digit = @n_str.size
  end

  def run
    puts solve
  end

  def solve
    nums = [nil, 3, 5, 7]

    count = 0

    i = 0
    loop do
      num = 0
      i.to_s(4).chars.reverse.each_with_index do |j, d|
        next if j == "0"
        num += nums[j.to_i] * (10 ** d)
      end

      break if num > @n

      count += 1 if number_357?(num)

      i += 1
    end

    count
  end

  def number_357?(num)
    count = Array.new(10) { 0 }
    num.to_s.chars { |c| count[c.to_i] += 1 }

    return false if count[3] == 0 || count[5] == 0 || count[7] == 0
    count[3] + count[5] + count[7] == num.to_s.size
  end
end

ABC114C.new.run

__END__
=input
575
=expect
4
=input
3600
=expect
13
=input
999999999
=expect
26484
