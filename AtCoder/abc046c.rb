# https://atcoder.jp/contests/abc046/tasks/arc062_a

class Solver
  attr_reader :ta

  def initialize(ta)
    @ta = ta
  end

  def solve
    require "bigdecimal/util"

    t_count, a_count = 1, 1

    ta.each do |t, a|
      n = [(t_count / t.to_d).ceil, (a_count / a.to_d).ceil].max
      t_count = t * n
      a_count = a * n
    end

    return t_count + a_count
  end
end

ta = (gets.to_i).times.map { gets.split(" ").map(&:to_i) }

puts Solver.new(ta).solve
