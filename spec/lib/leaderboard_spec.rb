require 'spec_helper'

RSpec.describe Leaderboard do
  describe ".new" do
  leaderboard = Leaderboard.new
  it "has unique team names for each team object" do
    require 'pry'
    binding.pry
    expect(leaderboard.teams.uniq.size).to eq(4)

    end
  end
end
