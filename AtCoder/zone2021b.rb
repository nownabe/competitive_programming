#

class ZONE2021B
  attr_reader

  def initialize
    @n, @D, @H = gets.split(" ").map(&:to_i)
    @ds = []
    @hs = []
    @n.times do
      d, h = gets.split(" ").map(&:to_i)
      @ds << d
      @hs << h
    end
  end

  def run
    puts solve
  end

  def solve
    max = 0

    @n.times do |i|
      d, h = @ds[i], @hs[i]
      height = h - d.to_f * (@H - h) / (@D - d).to_f

      max = height if height > max
    end

    max
  end
end

ZONE2021B.new.run

__END__
=input
1 10 10
3 5
=expect
2.857142857142857
=input
1 10 10
3 2
=expect
0.0
=input
5 896 483
228 59
529 310
339 60
78 266
659 391
=expect
245.3080684596577
