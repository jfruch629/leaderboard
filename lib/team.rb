class Team
  attr_accessor :name, :rank, :wins, :losses

  def initialize(name, rank = nil, wins = 0, losses = 0)
    @name = name
    @wins = wins
    @losses = losses
    @rank = rank
  end
end
