# https://atcoder.jp/contests/abc051/tasks/abc051_c

class ABC051C
  attr_reader :sx, :sy, :tx, :ty

  def initialize
    @sx, @sy, @tx, @ty = gets.split(" ").map(&:to_i)
  end

  def run
    puts solve.join
  end

  def solve
    route = []

    # s -> t
    route += ["U"] * (ty - sy)
    route += ["R"] * (tx - sx)

    # t -> s
    route += ["D"] * (ty - sy)
    route += ["L"] * (tx - sx)

    # s -> t
    route += ["L"]
    route += ["U"] * (ty - sy + 1)
    route += ["R"] * (tx - sx + 1)
    route += ["D"]

    # t -> s
    route += ["R"]
    route += ["D"] * (ty - sy + 1)
    route += ["L"] * (tx - sx + 1)
    route += ["U"]

    route
  end
end

ABC051C.new.run

__END__
=input
0 0 1 2
=expect
UURDDLLUUURRDRDDDLLU
=input
-2 -2 1 1
=expect
UURRURRDDDLLDLLULUUURRURRDDDLLDL
