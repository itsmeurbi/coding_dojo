class TennisGame1
  PLAYER_POINTS_WORDING = {
    0 => 'Love',
    1 => 'Fifteen',
    2 => 'Thirty',
    3 => 'Forty',
  }.freeze
  EQUAL_POINTS_WORDING = {
    0 => 'Love-All',
    1 => 'Fifteen-All',
    2 => 'Thirty-All',
  }.freeze

  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(player_name)
    if player_name == 'player1'
      @p1_points += 1
    else
      @p2_points += 1
    end
  end

  def score
    if players_have_same_score?
      EQUAL_POINTS_WORDING.fetch(@p1_points, 'Deuce')
    elsif any_player_with_advantage?
      potential_winner_wording
    else
      "#{player_points_wording(@p1_points)}-#{player_points_wording(@p2_points)}"
    end
  end

  private

  def players_have_same_score?
    @p1_points == @p2_points
  end

  def any_player_with_advantage?
    @p1_points >= 4 || @p2_points >= 4
  end

  def potential_winner_wording
    minus_result = @p1_points - @p2_points
    if (minus_result == 1)
      'Advantage player1'
    elsif (minus_result == -1)
      'Advantage player2'
    elsif (minus_result >= 2)
      'Win for player1'
    else
      'Win for player2'
    end
  end

  def player_points_wording(points)
    PLAYER_POINTS_WORDING[points]
  end
end

