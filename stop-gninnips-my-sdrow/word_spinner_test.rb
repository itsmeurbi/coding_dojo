require 'minitest'
require 'minitest/autorun'
require_relative 'word_spinner'

class WordSpinnerTest < Minitest::Test
  def test_it_does_not_spin_a_word_with_less_tha_5_characters
    response = word_spinner('kata')

    assert_equal 'kata', response
  end

  def test_it_spin_a_word_longer_than_4_characters
    response = word_spinner('spinning')

    assert_equal 'gninnips', response
  end

  def test_it_works_with_empty_space_separated_word1
    response = word_spinner('Hey fellow michelados')

    assert_equal 'Hey wollef sodalehcim', response
  end

  def test_it_works_with_empty_space_separated_word2
    response = word_spinner('This is another test')

    assert_equal 'This is rehtona test', response
  end
end
