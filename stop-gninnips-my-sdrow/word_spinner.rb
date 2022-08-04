SIZE_FOR_WORD_TO_BE_REVERSED = 5

# O(n)
def word_spinner(string_input)
  words = string_input.split(' ')
  words.map do |word|
    next word if word.size < SIZE_FOR_WORD_TO_BE_REVERSED

    word.reverse
  end.join(' ')
end
