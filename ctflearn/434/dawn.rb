#!/usr/bin/ruby
# https://ctflearn.com/challenge/434

STATES = {"." => 0, "_" => 1, "\\" => 2, "-" => 3, "/" => 4, "|" => 5, "*" => 6}

# capture the lawn
buffer = String.new
loop do
	ch = gets
	break if ch.codepoints[0] == 10 # enter key
	buffer << ch
end

SIZE = buffer.count("\n")
LAWNS = Array.new(SIZE ** 2)

# building the lawn
i = 0;
buffer.split("\n").each do |l|
	x = -1;
	SIZE.times do |t|
		LAWNS[i + (t * SIZE)] = STATES[l[x += 1]]
	end
	i += 1
end

GROWTH = Array.new(SIZE ** 2)
GROWTH.fill -1

# mowing the lawn
(SIZE ** 2).times do |m|
	GROWTH.each_index do |g|
		GROWTH[g] += 1 if GROWTH[g] >= 0
		if GROWTH[g] == SIZE
			LAWNS[g] = [6, LAWNS[g] + 1].min if LAWNS[g] != 0 # infertile
			GROWTH[g] = 0
		end
	end

	LAWNS[m] = [0, LAWNS[m] - 2].max # mow
	GROWTH[m] = 0
end

# drawing the lawn
f = 0
(SIZE).times do |x|
	l = String.new
	(SIZE).times do |y|
		t = LAWNS[x + (y * SIZE)]
		f += 1 if t == 6
		l += (STATES.rassoc t)[0]
	end
	puts l
end
puts "#{SIZE}x#{SIZE} Lawn: #{f} flowers"
