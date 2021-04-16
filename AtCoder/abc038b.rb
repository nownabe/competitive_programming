# https://atcoder.jp/contests/abc038/tasks/abc038_b

h1, w1 = gets.split(" ").map(&:to_i)
h2, w2 = gets.split(" ").map(&:to_i)

if h1 == h2 || h1 == w2 || w1 == h2 || w1 == w2
  puts "YES"
else
  puts "NO"
end

__END__
=input
1080 1920
1080 1920
=expect
YES
=input
1080 1920
1920 1080
=expect
YES
=input
334 668
668 1002
=expect
YES
=input
100 200
300 150
=expect
NO
=input
120 120
240 240
=expect
NO
