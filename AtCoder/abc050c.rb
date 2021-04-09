# https://atcoder.jp/contests/abc050/tasks/arc066_a

def solve(n, a)
  counter = Hash.new { |h, k| h[k] = 0 }

  a.each { |ai| counter[ai] += 1 }

  return 0 if counter[0] > 1

  counter.delete(0)
  return 0 if counter.values.any? { |v| v != 2 }

  (2 ** (n / 2)) % (10 ** 9 + 7)
end

n = gets.to_i
a = gets.split(" ").map(&:to_i)

puts solve(n, a)
