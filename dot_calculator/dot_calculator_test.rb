require 'minitest'
require 'minitest/autorun'
require_relative 'dot_calculator'

class DotCalculatorTest < Minitest::Test
  def test_addition_works1
    response = dot_calculator('. + .')

    assert_equal('..', response)
  end

  def test_addition_works2
    response = dot_calculator('... + .')

    assert_equal('....', response)
  end

  def test_substraction_works1
    response = dot_calculator('..... - ..')

    assert_equal('...', response)
  end

  def test_substraction_works2
    response = dot_calculator('.. - .')

    assert_equal('.', response)
  end

  def test_multiplication_works1
    response = dot_calculator('.. * ........')

    assert_equal('................', response)
  end

  def test_multiplication_works2
    response = dot_calculator('.. * ..')

    assert_equal('....', response)
  end

  def test_integer_division_works
    response = dot_calculator('.... // ..')

    assert_equal('..', response)
  end

  def test_integer_division_works1
    response = dot_calculator('.... // ..')

    assert_equal('..', response)
  end

  def test_integer_division_works2
    response = dot_calculator('.. // ...')

    assert_equal('', response)
  end
end
