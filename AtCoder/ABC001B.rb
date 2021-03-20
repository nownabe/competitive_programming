m = gets.to_i

vv = case
  when m < 100 then 0
  when m >= 100 && m <= 5000 then m / 100.0
  when m >= 6000 && m <= 30000 then m / 1000.0 + 50
  when m >= 35000 && m <= 70000 then (m / 1000.0 - 30) / 5 + 80
  when m > 70000 then 89
  end

puts("%02d" % [vv])

