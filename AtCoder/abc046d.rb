# https://atcoder.jp/contests/abc046/tasks/arc062_b

class Solver
  def initialize(s)
    @s = s.chars
  end

  def solve
    g_count = 0
    score = 0

    @s.each do |s|
      if s == "g"
        g_count += 1
      else
        if g_count == 0 # gを出すしかない
          score -= 1
          g_count += 1
        else # pを出せる
          g_count -= 1 # 今回のpを打ち消し
        end
      end
    end

    if g_count > 0
      score += g_count / 2
    end

    score
  end
end

s = gets.chomp

puts Solver.new(s).solve
