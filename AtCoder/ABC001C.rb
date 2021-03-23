# https://atcoder.jp/contests/abc001/tasks/abc001_3

deg, dis = gets.split(" ").map(&:to_i)

directions = %i(NNE NE ENE E ESE SE SSE
                S SSW SW WSW W WNW NW NNW)

offset = 112

dir = nil

directions.each_with_index do |d, i|
  lower = offset + 225 * i
  upper = offset + 225 * (i + 1)

  if lower < deg && deg <= upper
    dir = d
  end
end

dir ||= :N

power_levels = [3, 16, 34, 55,
                80, 108, 139, 172, 208,
                245, 285, 327]

speed = (dis / 6.0).round

w = nil

power_levels.each_with_index do |l, i|
  if speed < l
    w = i
    break
  end
end

w ||= 12

if w.zero?
  puts("C 0")
else
  puts("#{dir} #{w}")
end
