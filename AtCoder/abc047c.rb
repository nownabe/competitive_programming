# https://atcoder.jp/contests/abc047/tasks/arc063_a

class Solver
  def initialize(s)
    @s = s
  end

  def solve
    s = @s.chars

    count = 0
    reverse = { "B" => "W", "W" => "B" }

    loop do
      break if s.all? { |c| c == "B" } || s.all? { |c| c == "W" }

      c = s[-1]
      r = reverse[c]

      (s.length - 1).step(0, -1) do |i|
        if s[i] == c
          s[i] = r
        else
          break
        end
      end

      s << r
      count += 1
    end

    count
  end

  def solve2
    before = @s.chars.first
    count = 0

    @s.chars.each do |c|
      if before != c
        count += 1
        before = c
      end
    end

    count
  end
end

s = gets.chomp
puts Solver.new(s).solve2
