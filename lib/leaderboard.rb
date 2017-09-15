require_relative "team"

class Leaderboard
  attr_reader :teams
  attr_accessor :grid

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
    @grid = [
      ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'],
      ['|',' Name  ','    Rank  ',' Total Wins  ',' Total Losses  ','|'],
      ['|',nil,nil,nil,nil,'       |'],
      ['|',nil,nil,nil,nil,'       |'],
      ['|',nil,nil,nil,nil,'        |'],
      ['|',nil,nil,nil,nil,'          |'],
      ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-']
    ]
    @teams = build_teams
  end

  def build_teams
    @teams = Array.new()
    GAME_INFO.each do |game|
      away_team_exists = @teams.find { |team| team.name == game[:away_team]}
      home_team_exists = @teams.find { |team| team.name == game[:home_team]}
        if away_team_exists.nil?
          @teams << Team.new(game[:away_team])
        elsif home_team_exists.nil?
          @teams << Team.new(game[:home_team])
        end
      end
      @teams
    end


  def fill_team_stats
    GAME_INFO.each do |game|
      @teams.each do |team|
        if game[:home_team] == team.name
          if game[:home_score] < game[:away_score]

            team.losses += 1
          elsif game[:home_score] > game[:away_score]
            team.wins += 1
          end
        elsif game[:away_team] == team.name
          if game[:away_score] < game[:home_score]
            team.losses += 1
          elsif game[:away_score] > game[:home_score]
            team.wins += 1
          end
        end
      end
      @teams.sort_by! { |team| team.losses}
      @teams.each_with_index do |team, index|
        team.rank = index + 1
      end
      @teams
    end
  end


  def create_leaderboard
    @grid.each do |row|
      row.each_with_index do |char, index|
        if char.equal?(row[-1])
          puts char
        elsif ['-','|',' Name  ','    Rank  ',' Total Losses  ',' Total Wins  '].include?(char)
          print char
        else
          print char
        end
      end
    end
  end
end
