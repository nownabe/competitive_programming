# https://atcoder.jp/contests/abc202/tasks/abc202_d

class ABC202D
  attr_reader

  def initialize
    @a, @b, @k = gets.split(" ").map(&:to_i)
    @total_nums = combination
  end

  def run
    puts solve(@a, @b, @k)
  end

  def solve(num_a, num_b, k)
    return "a" * num_a if num_b == 0
    return "b" * num_b if num_a == 0

    if @total_nums[num_a - 1][num_b] >= k
      "a" + solve(num_a - 1, num_b, k)
    else
      "b" + solve(num_a, num_b - 1, k - @total_nums[num_a - 1][num_b])
    end
  end

  def combination
    dp = Array.new(@a + 1) { Array.new(@b + 1) { 0 } }
    dp[0][0] = 1

    (@a + 1).times do |i|
      (@b + 1).times do |j|
        dp[i][j] += dp[i][j - 1] + dp[i - 1][j]
      end
    end

    dp
  end
end

ABC202D.new.run

__END__
=input
2 2 4
=expect
baab
=input
30 30 118264581564861424
=expect
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
