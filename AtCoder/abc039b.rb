# https://atcoder.jp/contests/abc039/tasks/abc039_b

class ABC039B
  attr_reader :x

  def initialize
    @x = gets.to_i
  end

  def run
    puts Math.sqrt(Math.sqrt(x)).to_i
  end
end

ABC039B.new.run
