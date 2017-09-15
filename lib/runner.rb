require_relative "leaderboard"

leaderboard = Leaderboard.new
leaderboard.fill_team_stats

leaderboard.grid[2..5].each_with_index do |row, row_index|
    leaderboard.teams.each_with_index do |team, team_index|
      if team.rank == (leaderboard.grid.index(row) - 1)
        row[1] = " #{team.name}     "
        row[2] = "#{team.rank}   "
        row[3] = "  #{team.wins}      "
        row[4] = "       #{team.losses}   "
      end
    end
  end

leaderboard.create_leaderboard
