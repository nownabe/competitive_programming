class Tatami
  attr_accessor :map
  attr_reader :h, :w, :a, :b, :y, :x
  attr_reader :count_a, :count_b

  def initialize(h, w, a, b, y, x)
    @h = h
    @w = w
    @a = a
    @b = b
    @y = y
    @x = x
    @map = Array.new(h, Array.new(w, nil))
  end

  def next_tatamis
    next_x = (x + 1) % w
    next_y = next_x == 0 ? y + 1 : y

    return [self] if y >= h && x >= w

    if y >= 1 && map[y-1][x] == :tate1
      t2 = clone(a, b, next_y, next_x)
      t2.map[y][x] = :tate2
      return [t2]
    end

    if x >= 1 && map[y][x-1] == :yoko1
      t2 = clone(a, b, next_y, next_x)
      t2.map[y][x] = :yoko2
      return [t2]
    end
    return [] if a == 0 && b == 0

    n_tatamis = []

    if y <= h - 2 && a > 0
      t2 = clone(a - 1, b, next_y, next_x)
      t2.map[y][x] = :tate1
      n_tatamis << t2
    end

    if x <= w - 2 && a > 0 && map[y-1][x+1] != :tate1
      t2 = clone(a - 1, b, next_y, next_x)
      t2.map[y][x] = :yoko1
      n_tatamis << t2
    end

    if b > 0
      t2 = clone(a, b - 1, next_y, next_x)
      t2.map[y][x] = :b
      n_tatamis << t2
    end

    n_tatamis
  end

  def clone(a, b, y, x)
    t2 = Tatami.new(@h, @w, a, b, y, x)
    t2.map = @map.map { |m| m.map { |n| n } }
    t2
  end

  def complete?
    @map.all? { |m| m.all? }
  end
end

h, w, a, b = gets.split(" ").map(&:to_i)

t = Tatami.new(h, w, a, b, 0, 0)
tatamis = [t]

loop do
  tatamis = tatamis.map { |t| t.next_tatamis }.flatten
  break if tatamis.all?(&:complete?)
end

puts tatamis.count { |t| t.complete? }
