# https://atcoder.jp/contests/abc045/tasks/arc061_b


class Solver
  def initialize(h, w, n, a, b)
    @h = h
    @w = w
    @n = n
    @a = a
    @b = b
  end

  def solve1
    black = Array.new(@h) { Array.new(@w) { false } }
    @n.times { |i| black[@a[i] - 1][@b[i] - 1] = true }

    counter = Hash.new { |h, k| h[k] = 0 }

    (@h - 2).times do |i|
      (@w - 2).times do |j|
        count = 0

        i.step(i + 2) do |y|
          j.step(j + 2) do |x|
            count += 1 if black[y][x]
          end
        end

        counter[count] += 1
      end
    end

    10.times.map { |i| counter[i] }
  end

  def solve2
    boxes = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = 0 } }

    @n.times do |i|
      a, b = @a[i] - 1, @b[i] - 1

      a.step(a - 2, -1) do |y|
        b.step(b - 2, -1) do |x|
          next if y < 0 || x < 0 || y + 3 > @h || x + 3 > @w
          boxes[y][x] += 1
        end
      end
    end

    counter = Array.new(10) { 0 }

    boxes.values.map { |v| v.values }.flatten.each { |j| counter[j] += 1 }

    counter[0] = (@h - 2) * (@w - 2) - counter.sum

    counter
  end
end


h, w, n = gets.split(" ").map(&:to_i)

a = []
b = []

n.times do
  ai, bi = gets.split(" ").map(&:to_i)
  a << ai
  b << bi
end


puts Solver.new(h, w, n, a, b).solve2
