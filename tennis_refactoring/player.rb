class Player
  POINTS_WORDING = {
    0 => 'Love',
    1 => 'Fifteen',
    2 => 'Thirty',
    3 => 'Forty',
  }.freeze

  attr_accessor :name, :points

  def initialize(name:, points: 0)
    @name = name
    @points = points
  end

  def add_point!
    @points += 1;
  end

  def score
    POINTS_WORDING[points]
  end
end
