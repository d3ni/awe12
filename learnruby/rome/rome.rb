#!/usr/bin/env ruby
class Rome

  def self.to_dec (rome)
    prev = dec = 0
    rome.scan(/./){ |c|
      i = ' IVXLCDM'.index c
      curr = 10**(i/2) / (2-i%2)
      dec += prev < curr ? -prev : prev
      prev = curr
    }

    dec + prev
  end

  def self.to_rome (dec)
    rome = ""
    s = "IVXLCDM"
    i = 0
    dec.to_s.split("").reverse.each { |d|
      d = d.to_i
      if d < 4
        rome = s[i] * d + rome
      elsif d == 4
        rome = s[i] + s[i+1] + rome
      elsif d == 5
        rome = s[i+1] + rome
      elsif d > 5 && d < 9
        rome = s[i+1] + s[i] * (d-5) + rome
      elsif d == 9
        rome = s[i] + s[i+2] + rome
      end
      i+=2
    }

    return rome
  end
end
