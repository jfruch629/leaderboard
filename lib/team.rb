class Team
  require_relative '../lib/leaderboard'
  attr_reader :name, :rank, :wins, :losses

  def initialize(name, rank = nil, wins = 0, losses = 0)
    @name = name
    @wins = wins
    @losses = losses
    @rank = rank
  end
end
