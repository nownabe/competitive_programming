# https://atcoder.jp/contests/abc039/tasks/abc039_d

if ENV["ATCODER_TEST"] == "true"
  require "./base"
else
  Base = Class.new { def self.add_sample(*args); end }
end

class ABC039D < Base
  add_sample(
    input: ["4 4",
            "##..",
            "##..",
            "..##",
            "..##"],
    expect: ["possible",
             "#...",
             "....",
             "....",
             "...#"],
  )
  add_sample(
    input: ["4 4",
            "###.",
            "####",
            "..##",
            "..##"],
    expect: ["possible",
             "##..",
             "....",
             "...#",
             "...#"],
  )
  add_sample(
    input: ["4 4",
            "###.",
            "##.#",
            "..##",
            "..##"],
    expect: ["impossible"],
  )

  attr_reader :h, :w, :s

  def initialize
    @h, @w = gets.split(" ").map(&:to_i)
    @s = []
    @h.times { @s << gets.chomp.chars }
  end

  def run
    ans = solve

    if ans
      puts "possible"
      puts ans
    else
      puts "impossible"
    end
  end

  def solve
    source = Array.new(h) { Array.new(w) }
    check = Array.new(h) { |i| Array.new(w) { |j| s[i][j] != "#" } }

    h.times do |i|
      w.times do |j|
        all = 0
        black = 0

        (i - 1).step(i + 1) do |x|
          next if x < 0 || x >= h

          (j - 1).step(j + 1) do |y|
            next if y < 0 || y >= w

            all += 1
            black += 1 if s[x][y] == "#"
          end
        end

        if all == black
          source[i][j] = "#"
          (i - 1).step(i + 1) do |x|
            next if x < 0 || x >= h

            (j - 1).step(j + 1) do |y|
              next if y < 0 || y >= w

              check[x][y] = true
            end
          end
        else
          source[i][j] = "."
        end
      end
    end

    if check.all? { |r| r.all? }
      source.map { |r| r.join }
    else
      nil
    end
  end
end

ABC039D.new.run
