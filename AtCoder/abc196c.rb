n = gets.chomp
ni = n.to_i
digit = n.size

sum = 0

2.step(digit - 1, 2) do |d|
  half = (d + 1) / 2
  sum += 10 ** half - 10 ** (half - 1)
end

if digit % 2 == 0
  half = digit / 2
  if half == 1
    sum += n[0].to_i
  else
    half_max = n[0...half]
    (10 ** (half - 1)).step(half_max.to_i) do |i|
      sum += 1 if (i.to_s * 2).to_i <= ni
    end
  end
end

puts(sum)
