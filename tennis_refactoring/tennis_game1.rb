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

  # potential bug if players have same name
  def won_point(player_name)
    player = find_player(player_name)
    player.add_point!
  end

  def score
    if winner.present?
      "Win for #{winner.name}"
    elsif player_with_advantage.present?
      "Advantage #{player_with_advantage.name}"
    elsif players_have_same_score?
      EQUAL_POINTS_WORDING.fetch(player1.points, 'Deuce')
    else
      "#{player1.score}-#{player2.score}"
    end
  end

  private

  attr_reader :player1, :player2

  def players_have_same_score?
    player1.points == player2.points
  end

  def late_game?
    player1.points >= 4 || player2.points >= 4
  end

  def player_with_advantage
    return nil unless late_game?

    return player1 if (player1.points - player2.points) == 1

    return player2 if (player2.points - player1.points) == 1
  end

  def winner
    return nil unless late_game?

    return player1 if (player1.points - player2.points) >= 2

    return player2 if (player2.points - player1.points) >= 2
  end

  def find_player(name)
    return player1 if name == player1.name

    player2
  end
end
