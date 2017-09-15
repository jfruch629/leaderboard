require 'spec_helper'

RSpec.describe Leaderboard do
  describe ".new" do
  leaderboard = Leaderboard.new
    it "has unique team names for each team object through the #build_teams method" do
      expect(leaderboard.teams.uniq.size).to eq(4)
    end
    it "has nil for rank, 0 for wins, and 0 for losses upon creation" do
      expect(leaderboard.teams[1].wins).to eq(0)
      expect(leaderboard.teams[1].losses).to eq(0)
      expect(leaderboard.teams[1].rank).to eq(nil)
    end
  end

  describe "#fill_team_stats" do
    leaderboard = Leaderboard.new
    it "adds proper wins, losses, and rank for each Team Object" do
      leaderboard.fill_team_stats

      expect(leaderboard.teams[0].wins).to eq(3)
      expect(leaderboard.teams[0].losses).to eq(0)
      expect(leaderboard.teams[0].rank).to eq(1)

      expect(leaderboard.teams[1].wins).to eq(1)
      expect(leaderboard.teams[1].losses).to eq(1)
      expect(leaderboard.teams[1].rank).to eq(2)
    end
  end
end
