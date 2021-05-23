# https://atcoder.jp/contests/abc058/tasks/arc071_a

class ABC058C
  attr_reader

  def initialize
    @n = gets.to_i
    @strings = []
    @n.times { @strings << gets.chomp }
  end

  def run
    puts solve
  end

  def solve
    chars = count_chars(@strings[0])

    @strings[1..-1].each do |str|
      this_chars = count_chars(str)
      next_chars = {}

      chars.each do |c, count|
        next unless this_chars.key?(c)
        next_chars[c] = count >= this_chars[c] ? this_chars[c] : count
      end

      chars = next_chars
    end

    chars.keys.sort.map { |c| c * chars[c] }.join
  end

  def count_chars(str)
    chars = Hash.new { |h, k| h[k] = 0 }
    str.chars.each { |c| chars[c] += 1 }
    chars
  end
end

ABC058C.new.run

__END__
=input
3
cbaa
daacc
acacac
=expect
aac
=input
3
a
aa
b
=expect

