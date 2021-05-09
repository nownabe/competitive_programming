# https://atcoder.jp/contests/abc200/tasks/abc200_d

class ABC200D
  attr_reader

  def initialize
    @n = gets.to_i
    @as = gets.split(" ").map(&:to_i).map { |a| a % 200 }
  end

  def run
    solve2
  end

  # Editorial
  def solve2
    n = [@n, 8].min

    seqs = Array.new(200)

    (1 << n).times do |bit|
      next if bit == 0

      val = 0
      seq = []
      @as[0...n].each_with_index do |a, i|
        if (1 << i) & bit != 0
          val = (val + a) % 200
          seq << i + 1
        end
      end

      if seqs[val]
        puts "Yes"
        puts "#{seqs[val].size} #{seqs[val].join(" ")}"
        puts "#{seq.size} #{seq.join(" ")}"
        return
      end

      seqs[val] = seq
    end

    puts "No"
  end

  # AC
  def solve
    @rests = {}
    search(0, 0, [0, ""])
    puts "No"
  end

  def search(i, sum, route)
    return if i >= @n

    rest = (sum + @as[i]) % 200
    next_route = [route[0] + 1, "#{route[1]} #{i + 1}"]

    if @rests.key?(rest)
      another_route = @rests[rest]
      puts "Yes"
      puts "#{another_route[0]}#{another_route[1]}"
      puts "#{next_route[0]}#{next_route[1]}"
      exit
    end

    @rests[rest] = next_route

    search(i + 1, sum, route)
    search(i + 1, sum + @as[i], next_route)
  end
end

ABC200D.new.run

__END__
=input
5
180 186 189 191 218
=expect
Yes
1 1
2 3 4
=input
2
123 523
=expect
Yes
1 1
1 2
=input
6
2013 1012 2765 2021 508 6971
=expect
No
