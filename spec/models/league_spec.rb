require "rails_helper"

RSpec.describe League, type: :model do
  include ActiveSupport::Testing::TimeHelpers
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

      it "does returns nil when the game is in the past" do
        travel_to 4.days.from_now do
          expect(league.next_game).to be_nil
        end
      end
    end

    describe "when it is a league game"
  end
end
