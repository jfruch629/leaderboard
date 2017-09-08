class Leaderboard
  require_relative '../lib/team'

  attr_reader :teams

GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

  def initialize
    @teams = build_leaderboard
  end

  def build_leaderboard
    teams = Hash.new()
    GAME_INFO.each do |game|
      # if there is already a team named game[:away_team]
      # create a hash of hashes? Where the key from the first has is the name of the team which will point to the hash
      # containing wins, losses, and rank
       team_1 = Hash.new(Team.new(game[:away_team]))
    end
  end
end

leaderboard = Leaderboard.new
leaderboard.inspect
