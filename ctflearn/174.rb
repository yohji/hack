#!/usr/bin/ruby
# https://ctflearn.com/challenge/174

s = 0
IO.foreach("/tmp/data.dat") do |l|
	s += 1 if l.count("0") % 3 == 0 or l.count("1") % 2 == 0
end

puts s
