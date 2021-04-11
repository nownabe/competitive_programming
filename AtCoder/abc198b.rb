# https://atcoder.jp/contests/abc198/tasks/abc198_b

class B
  def initialize
  end

  def run
    n = gets.to_i


    if kaibun?(n.to_s)
      puts "Yes"
    else
      puts "No"
    end
  end

  def kaibun?(s)
    10.times do |i|
      ss = "0" * i + s
      if ss[0..(s.length/2)] == ss.reverse[0..(s.length/2)]
        return true
      end
    end
    return false
  end
end

B.new.run
