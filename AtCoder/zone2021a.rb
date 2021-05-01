#

class ZONE2021A
  attr_reader

  def initialize
    @s = gets.chomp
  end

  def run
    puts solve
  end

  def solve
    count = 0
    0.step(@s.length - 4) do |i|
      count += 1 if @s[i...(i + 4)] == "ZONe"
    end
    count
  end
end

ZONE2021A.new.run

__END__
=input
abcdZONefghi
=expect
1
=input
ZONeZONeZONe
=expect
3
=input
helloAtZoner
=expect
0
