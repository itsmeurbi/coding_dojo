require 'minitest'
require 'minitest/autorun'
require_relative 'phone_number_formater'

class PhoneNumberFormaterTest < Minitest::Test
  def test_it_works_formating_phone_number
    response = format_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])

    assert_equal '(123) 456-7890', response
  end

  def test_it_works_formating_phone_number_2
    response = format_phone_number([3, 1, 2, 4, 5, 6, 7, 8, 1, 0])

    assert_equal '(312) 456-7810', response
  end
end
