def format_phone_number(digits)
  digits_string = digits.join
  first_part = digits_string[0..2]
  second_part = digits_string[3..5]
  last_part = digits_string[6..9]
  "(#{first_part}) #{second_part}-#{last_part}"
end
