# https://atcoder.jp/contests/abc049/tasks/arc065_a

def solve(s)
  s = s.reverse

  words = %w(dream dreamer erase eraser).map(&:reverse)

  i = 0
  loop do
    break if i == s.length

    flag = false

    words.each do |word|
      next unless s[i..-1].start_with?(word)

      flag = true
      i += word.length
    end

    return false unless flag
  end

  true
end

s = gets.chomp

if solve(s)
  puts "YES"
else
  puts "NO"
end

