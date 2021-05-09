#

class ABC200B
  attr_reader

  def initialize
    @n, @k = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve
  end

  def solve
    n = @n
    @k.times do
      if n % 200 == 0
        n /= 200
      else
        n = "#{n}200".to_i
      end
    end
    n
  end
end

ABC200B.new.run

__END__
=input
2021 4
=expect
50531
=input
40000 2
=expect
1
=input
8691 20
=expect
84875488281
