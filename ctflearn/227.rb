#!/usr/bin/ruby
# https://ctflearn.com/challenge/227

def xor_decrypt(str, key)
	res = String.new
	bytes = str.unpack("S*")

	bytes.each do |b| # 16bit
		buffer = (b ^ key)
		res += (buffer & 0xff).chr
		res += (buffer >> 8).chr
	end

	return res
end

data = Array.new
10000.times do |i|
	data.push(xor_decrypt "q{vpln'bH_varHuebcrqxetrHOXEj ", i)
end

puts data.grep /.*flag.*/
