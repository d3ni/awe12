#!/usr/bin/env ruby
bads = 0
hidden = "aortenaneurysma"
left = hidden.length
secret = "_" * hidden.length
while left > 0
 puts secret + " %d chars left, %i bads\n" % [left,bads]
 input = gets[0]
 i = 0
 hidden.each_char do |c|
  if c == input 
   secret[i] = input
   left-=1
  else 
   bads+=1
  end
  i+=1
 end
end
puts "well done. you found %s," % [hidden]
