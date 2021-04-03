# https://atcoder.jp/contests/abc048/tasks/arc064_a

def solve(n, x, a)
  count = 0

  loop do
    flag = true

    (n - 1).times do |i|
      if a[i] + a[i + 1] > x
        flag = false
        count += 1

        if i == 0
          if a[i + 1] > 0
            a[i + 1] -= 1
          elsif a[i] > 0
            a[i] -= 1
          else
            count -= 1
          end
        elsif i + 1 == n - 1
          if a[i] > 0
            a[i] -= 1
          elsif a[i + 1] > 0
            a[i + 1] -= 1
          else
            count -= 1
          end
        elsif a[i] > 0 && a[i - 1] + a[i] > a[i + 1] + a[i + 2]
          a[i] -= 1
        elsif a[i + 1] > 0 && a[i + 1] + a[i + 2] > a[i - 1] + a[i]
          a[i + 1] -= 1
        elsif a[i] > 0
          a[i] -= 1
        elsif a[i + 1] > 0
          a[i + 1] -= 1
        else
          count -= 1
        end
      end
    end

    break if flag
  end

  count
end

def solve2(n, x, a)
  count = 0

  (n - 1).times do |i|
    sum = a[i] + a[i + 1]
    next if sum <= x

    diff = sum - x

    if a[i + 1] >= diff
      a[i + 1] -= sum - x
    else
      a[i] -= diff - a[i + 1]
      a[i + 1] = 0
    end

    count += diff
  end

  count
end

n, x = gets.split(" ").map(&:to_i)
a = gets.split(" ").map(&:to_i)

puts solve2(n, x, a)
