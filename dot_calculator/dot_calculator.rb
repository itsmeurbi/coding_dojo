VALID_EQUATION_REGEX = %r{^(\.+) (\+|-|\*|//) (\.+)$}
OPERATION_SYMBOLS_MAP = {
  '+' => '+',
  '-' => '-',
  '*' => '*',
  '//' => '/'
}.freeze

def dot_calculator(dot_equation)
  decimal_equation = dot_equation_to_decimal(dot_equation)
  decimal_result = solve_decimal_equation(decimal_equation)
  number_to_dots(decimal_result)
end

def dot_equation_to_decimal(equation)
  termn1, operation_symbol, termn2 = equation.match(VALID_EQUATION_REGEX).captures
  operation = OPERATION_SYMBOLS_MAP[operation_symbol]
  [termn1.size, operation, termn2.size]
end

def solve_decimal_equation(decimal_equation)
  decimal_termn1, operation, decimal_termn2 = decimal_equation
  decimal_termn1.send(operation, decimal_termn2)
end

def number_to_dots(number)
  '.' * number
end
