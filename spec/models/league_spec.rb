require "rails_helper"

RSpec.describe League, type: :model do
  it { should have_many :memberships }
  it { should have_many(:users).through(:memberships) }
  it { should have_many :seasons }
  it { should have_many(:season_games).through(:seasons) }
  it { should have_many :games }

  describe "#next_game" do
    let(:season) { create(:season) }
    let(:league) { season.league }

    describe "when it is a season game" do
      before do
        create(:game, league: league, date: 2.days.from_now)
        @season_game = create(:game, season: season, date: Date.tomorrow)
      end

      it "returns the next game" do
        expect(league.next_game).to eq(@season_game)  
      end
    end

    describe "when it is a league game"
  end
end
