#!/usr/bin/ruby
# https://www.hackthebox.eu/home/challenges/Crypto

MSG = "444333 99966688 277733 7773323444664 84433 22244474433777, 99966688 277733 666552999. 99966688777 777744277733 666333 84433 443344477778 4447777 44466 99966688777 4466688777733. 84433 5533999 8666 84433 55566622255 4447777 22335556669. 4666 8666 727774447777. 47777888 995559888 4555 47777888 44999988 666555997 : 8555444888477744488866888648833369!!"

SYMBOLS = {"2" => "ABC", "3" => "DEF", "4" => "GHI", "5" => "JKL", "6" => "MNO", "7" => "PQRS", "8" => "TUV", "9" => "WXYZ"}

plain = String.new
toks = MSG.scan(/((\d)\2*)|( |\.|:|!)/).map { |e| (e[0] =~ /\d.*/) ? e.first : e.last }
toks.each { |tok| plain += (tok =~ /\d.*/) ? SYMBOLS[tok[0]][tok.length - 1] : tok }
puts plain

flag = String.new
key = plain[/: (\w+)!!/, 1]
key.each_char { |ch| flag += (65 + (90 - ch.ord)).chr }
puts "#{flag}!!"
