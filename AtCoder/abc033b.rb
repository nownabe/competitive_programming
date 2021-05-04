# https://atcoder.jp/contests/abc033/tasks/abc033_b

class ABC033B
  attr_reader :n, :s, :p

  def initialize
    @n = gets.to_i
    @s = []
    @p = []
    @n.times do
      s, p = gets.split(" ")
      @s << s
      @p << p.to_i
    end
  end

  def run
    puts solve
  end

  def solve
    sum = 0
    max = 0
    max_i = nil

    n.times do |i|
      sum += p[i]
      if p[i] > max
        max = p[i]
        max_i = i
      end
    end

    if max > sum / 2
      s[max_i]
    else
      "atcoder"
    end
  end
end

ABC033B.new.run

__END__
=input
4
unagi 20
usagi 13
snuke 42
smeke 7
=expect
snuke
=input
5
a 10
b 20
c 30
d 40
e 100
=expect
atcoder
=input
14
yasuzuka 3340
uragawara 4032
oshima 2249
maki 2614
kakizaki 11484
ogata 10401
kubiki 9746
yoshikawa 5142
joetsu 100000
nakago 4733
itakura 7517
kiyosato 3152
sanwa 6190
nadachi 3169
=expect
joetsu
