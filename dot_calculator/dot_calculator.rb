VALID_EQUATION_REGEX = %r{^(\.+) (\+|-|\*|//) (\.+)$}
OPERATION_SYMBOLS_MAP = {
  '+' => '+',
  '-' => '-',
  '*' => '*',
  '//' => '/'
}.freeze

def dot_calculator(equation)
  termn1, operation_symbol, termn2 = equation.match(VALID_EQUATION_REGEX).captures
  decimal_termn1 = dots_to_number(termn1)
  decimal_termn2 = dots_to_number(termn2)
  operation = OPERATION_SYMBOLS_MAP[operation_symbol]
  equation_decimal_result = decimal_termn1.send(operation, decimal_termn2)
  number_to_dots(equation_decimal_result)
end

def number_to_dots(number)
  '.' * number
end


def dots_to_number(dots)
  dots.size
end
