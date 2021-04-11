# https://atcoder.jp/contests/abc198/tasks/abc198_e

class E
  attr_reader :n, :colors, :tree

  def initialize
    require "set"

    @n = gets.to_i
    @colors = gets.chomp.split(" ").map(&:to_i)

    @tree = Hash.new { |h, k| h[k] = Set.new }

    (@n - 1).times do
      a, b = gets.split(" ").map(&:to_i)
      @tree[a - 1].add(b - 1)
      @tree[b - 1].add(a - 1)
    end
  end

  def run
    puts solve
  end

  def solve
    @colors_count = Hash.new { |h, k| h[k] = 0 }
    @good = []
    @visited = Array.new(@n) { false }

    dfs(0)

    return @good.sort
  end

  def dfs(v)
    @visited[v] = true

    @good << v + 1 if @colors_count[colors[v]] == 0

    @colors_count[colors[v]] += 1

    tree[v].each do |w|
      next if @visited[w]
      dfs(w)
    end

    @colors_count[colors[v]] -= 1
  end
end

E.new.run
