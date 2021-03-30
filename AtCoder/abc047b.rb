# https://atcoder.jp/contests/abc047/tasks/abc047_b

w, h, n = gets.split(" ").map(&:to_i)

left, bottom = 0, 0
right, top = w, h

n.times do
  x, y, a = gets.split(" ").map(&:to_i)

  case a
  when 1
    left = x if x > left
  when 2
    right = x if x < right
  when 3
    bottom = y if y > bottom
  when 4
    top = y if y < top
  end
end

if right <= left || top <= bottom
  puts 0
else
  puts((right - left) * (top - bottom))
end
