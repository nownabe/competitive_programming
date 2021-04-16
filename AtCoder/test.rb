#!/usr/bin/env ruby

require "open3"

filename = ARGV[0]

code = File.read(filename)

samples = code.split("__END__\n")[1].split("=input\n")[1..-1]

samples.each_with_index do |sample, i|
  input, expect = sample.split("=expect\n")

  stdin, stdout, _, thread = *Open3.popen3("ruby #{filename}")
  stdin.write input
  actual = stdout.read

  thread.join

  puts
  if actual == expect
    puts "Sample #{i} - OK"
  else
    puts "Sample #{i} - Failed"
    puts
    puts "    input:"
    input.each_line { |l| puts "        #{l}" }
    puts
    puts "    expect:"
    expect.each_line { |l| puts "        #{l}" }
    puts
    puts "    actual:"
    actual.each_line { |l| puts "        #{l}" }
  end
end
