def word_spinner(string_input)
  words = string_input.split(' ')
  words.map do |word|
    next word if word.size < 5

    word.reverse
  end.join(' ')
end
