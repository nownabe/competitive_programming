# https://atcoder.jp/contests/abc038/tasks/abc038_a

if ENV["ATCODER_TEST"] == "true"
  require "./base"
else
  Base = Class.new { def self.add_sample(*args); end }
end

class ABC038A < Base
  add_sample(
    input: ["ICEDT"],
    expect: ["YES"],
  )
  add_sample(
    input: ["MUGICHA"],
    expect: ["NO"],
  )
  add_sample(
    input: ["OOLONGT"],
    expect: ["YES"],
  )
  add_sample(
    input: ["T"],
    expect: ["YES"],
  )
  add_sample(
    input: ["TEA"],
    expect: ["NO"],
  )

  attr_reader :s

  def initialize
    @s = gets.chomp
  end

  def run
    if solve
      puts "YES"
    else
      puts "NO"
    end
  end

  def solve
    @s[-1] == "T"
  end
end

ABC038A.new.run
