# https://atcoder.jp/contests/abc043/tasks/arc059_b

class Solver
  def initialize(s)
    @s = s
  end

  def solve
    if @s.length == 1
      puts "-1 -1"
      return
    end

    2.step(@s.length) do |l|
      (@s.length - l + 1).times do |offset|
        substr = @s[offset...(offset + l)]
        if unbalance?(substr)
          puts "#{offset + 1} #{offset + l}"
          return
        end
      end
    end

    puts("-1 -1")
  end

  def solve2
    if @s.length == 1
      puts "-1 -1"
      return
    end

    (@s.length - 2).times do |i|
      if @s[i] == @s[i + 1]
        puts "#{i + 1} #{i + 2}"
        return
      end

      if @s[i] == @s[i + 2]
        puts "#{i + 1} #{i + 3}"
        return
      end
    end

    if @s[-1] == @s[-2]
      puts "#{@s.length - 1} #{@s.length}"
      return
    end

    puts "-1 -1"
  end

  def unbalance?(s)
    counter = Hash.new { |h, k| h[k] = 0 }
    s.chars.each { |c| counter[c] += 1 }

    counter.values.max > s.length / 2
  end
end

s = gets.chomp

Solver.new(s).solve2
