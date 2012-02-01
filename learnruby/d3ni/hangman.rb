#!/usr/bin/env ruby
# Hangman by Thomas Liebschwager (d3ni@tzi.de)
words = %w(Faultier Feldhase Hanfseil Ortsteil Turbinen Ratgeber Giraffen Sturheit Geldwert Sandsack Sitzbank Nilpferd Blaumann)
MAXATTEMPTS = 6
attempts = 0
word = words[rand(words.size) - 1].upcase
display = word.gsub(/./, "_")
entered = Array.new

while attempts < MAXATTEMPTS
    print "#{display} \n"
    if display == word
        print "You win!\n"
        exit
    end    
    print "#{attempts} of #{MAXATTEMPTS} allowed errors\n"
    guess = gets.chomp.upcase
    
    if guess.size > 1
        print "Please Enter one (1) valid letter\n"
        next
    end
        
    if entered.index(guess) != nil
        print "You have already entered these letter\n"        
        next
    else
        entered.push(guess)
    end
    if word.index(guess) != nil
        word.size.times do |i|
            display[i] = guess if word[i].chr == guess
        end
    else
        attempts += 1
    end
end

print "You lose. The word is #{word}\n"
