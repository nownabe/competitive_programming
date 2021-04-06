# https://atcoder.jp/contests/abc041/tasks/abc041_c

gets
students = gets.split(" ").map.with_index { |a, i| [a.to_i, i + 1] }
puts students.sort { |a, b| b[0] <=> a[0] }.map { |s| s[1] }
