#

class ABC200A
  attr_reader

  def initialize
    @n = gets.to_i
  end

  def run
    puts((@n.to_f / 100).ceil)
  end

  def solve
  end
end

ABC200A.new.run

__END__
=input
2021
=expect
21
=input
200
=expect
2
