# https://atcoder.jp/contests/abc048/tasks/arc064_b

def solve(s)
  if s[0] == s[-1]
    if s.length % 2 == 0
      "First"
    else
      "Second"
    end
  else
    if s.length % 2 == 0
      "Second"
    else
      "First"
    end
  end
end

s = gets.chomp

puts solve(s)
