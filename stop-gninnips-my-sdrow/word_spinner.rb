def word_spinner(string_input)
  words = string_input.split(' ')
  words.map do |word|
    if word.size > 4
      word.reverse
    else
      word
    end
  end.join(' ')
end
