#!/usr/bin/env ruby
n = Random.rand(1..`wc -l american-english`.to_i) # random line number
hidden = `sed -ne '#{n} p' american-english`.chomp.downcase # get word with sed out of dict
if hidden[-2] == 39.chr # == ' 
 hidden=hidden[0...-2] #remove genitive 's like in elephant's
end
bads = 0
left = hidden.length
secret = "_" * hidden.length
a = []
#puts hidden #uncomment for better debugging
while left > 0
 puts secret + " %d chars left, %i bads (enter '?' to solve)\n" % [left,bads]
 input = gets[0]
 if input == '?'
  puts "the word you are searching for is \"%s\"" % [hidden]
  exit
 end
 if a.include?(input)
  puts "you already had %s" % input
 else
  a += [input]
  i = 0
  found=false
  hidden.each_char do |c|
   if c == input 
    secret[i] = input
    found=true
    left-=1
   end   
   i+=1
  end
  if !found 
   bads+=1
  end
 end
end
puts "well done. you found \"%s\" with %i bads" % [hidden,bads]
