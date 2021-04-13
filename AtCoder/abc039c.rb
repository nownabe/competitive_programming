# https://atcoder.jp/contests/abc039/tasks/abc039_c

if ENV["ATCODER_TEST"] == "true"
  require "./base"
else
  Base = Class.new { def self.add_sample(*args); end }
end

class ABC039A < Base
  add_sample(
    input: ["WBWBWWBWBWBWWBWBWWBW"],
    expect: ["Do"],
  )

  attr_reader :s

  def initialize
    @s = gets.chomp
  end

  KEYS = "WBWBWWBWBWBW" * 3
  TONES = ["Do", nil, "Re", nil, "Mi", "Fa", nil, "So", nil, "La", nil, "Si"]

  def run
    12.times do |i|
      keys = KEYS[i...(i + 20)]
      if s == keys
        puts TONES[i]
        return
      end
    end
  end
end

ABC039A.new.run
