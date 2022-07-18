require_relative 'player'

class TennisGame1
  EQUAL_POINTS_WORDING = {
    0 => 'Love-All',
    1 => 'Fifteen-All',
    2 => 'Thirty-All',
  }.freeze

  def initialize(player1_name, player2_name)
    @player1 = Player.new(name: player1_name)
    @player2 = Player.new(name: player2_name)
  end

  # potential bug if players have the same name
  def won_point(player_name)
    if player_name == player1.name
      player1.add_point!
    elsif player_name == player2.name
      player2.add_point!
    end
  end

  def score
    if players_have_same_score?
      EQUAL_POINTS_WORDING.fetch(player1.points, 'Deuce')
    elsif any_player_with_advantage?
      potential_winner_wording
    else
      "#{player1.score}-#{player2.score}"
    end
  end

  private

  attr_reader :player1, :player2

  def players_have_same_score?
    player1.points == player2.points
  end

  def any_player_with_advantage?
    player1.points >= 4 || player2.points >= 4
  end

  def potential_winner_wording
    minus_result = player1.points - player2.points
    if (minus_result == 1)
      "Advantage #{player1.name}"
    elsif (minus_result == -1)
      "Advantage #{player2.name}"
    elsif (minus_result >= 2)
      "Win for #{player1.name}"
    else
      "Win for #{player2.name}"
    end
  end
end
