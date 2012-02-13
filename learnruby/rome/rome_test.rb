#!/usr/bin/env ruby

require 'test/unit'
load 'rome.rb'

class RomeTest < Test::Unit::TestCase
  def test_to_dec
    assert_equal(Rome::to_dec("I"), 1)
    assert_equal(Rome::to_dec("V"), 5)
    assert_equal(Rome::to_dec("X"), 10)
    assert_equal(Rome::to_dec("L"), 50)
    assert_equal(Rome::to_dec("C"), 100)
    assert_equal(Rome::to_dec("D"), 500)
    assert_equal(Rome::to_dec("M"), 1000)
    assert_equal(Rome::to_dec("II"), 2)
    assert_equal(Rome::to_dec("III"), 3)
    assert_equal(Rome::to_dec("IV"), 4)
    assert_equal(Rome::to_dec("VI"), 6)
    assert_equal(Rome::to_dec("VII"), 7)
    assert_equal(Rome::to_dec("VIII"), 8)
    assert_equal(Rome::to_dec("IX"), 9)
    assert_equal(Rome::to_dec("XIII"), 13)
    assert_equal(Rome::to_dec("XIX"), 19)
    assert_equal(Rome::to_dec("XVI"), 16)
    assert_equal(Rome::to_dec("XXVI"), 26)
    assert_equal(Rome::to_dec("LXXIX"), 79)
    assert_equal(Rome::to_dec("XCIX"), 99)
    assert_equal(Rome::to_dec("CDLXXXIII"), 483)
    assert_equal(Rome::to_dec("CMXCIX"), 999)
    assert_equal(Rome::to_dec("MMMCMXCIX"), 3999)
  end

  def test_to_rome
    assert_equal("I", Rome::to_rome(1))
    assert_equal("V", Rome::to_rome(5))
    assert_equal("X", Rome::to_rome(10))
    assert_equal("L", Rome::to_rome(50))
    assert_equal("C", Rome::to_rome(100))
    assert_equal("D", Rome::to_rome(500))
    assert_equal("M", Rome::to_rome(1000))
    assert_equal("II", Rome::to_rome(2))
    assert_equal("IV", Rome::to_rome(4))
    assert_equal("VIII", Rome::to_rome(8))
    assert_equal("IX", Rome::to_rome(9))
    assert_equal("XV", Rome::to_rome(15))
    assert_equal("XIX", Rome::to_rome(19))
    assert_equal("XXXIV", Rome::to_rome(34))
    assert_equal("MMMCMXCIX", Rome::to_rome(3999))
    assert_equal("CDLXXXIII", Rome::to_rome(483))
    assert_equal("I", Rome::to_rome(1))
  end

end
