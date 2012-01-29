# encoding: utf-8
#!/usr/bin/env ruby
special_chars = %w{! $ % & / - _ + # ?}
chars = ("a".."z").to_a + ("A".."Z").to_a
numbers = ("0".."9").to_a

puts "Wie lang soll ein Passwort sein?"
length = gets.chomp.to_i
puts "Wieviele Passwörter sollen erzeugt werden?"
quantity = gets.chomp.to_i
puts "Passwörter"
length.times { print "-" }; print "\n"
quantity.times do
  puts "#{(special_chars + numbers + chars).to_a.shuffle[1..length].join}"  
end
