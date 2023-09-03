require "rails_helper"

RSpec.describe "Create game", type: :request do
  let!(:season) { create(:season, active: true) }
  let(:league) { season.league }
  let(:admin) { create(:membership, :admin, league: league).user }
  let(:game_attributes) { attributes_for(:game) }

  before { login(admin) }
  
  describe "POST /leagues/:league_id/games" do
    it "creates a game for an active season" do
      expect do
        post "/leagues/#{league.id}/games", params: {game: game_attributes, active_season: "1"}
      end.to change(Game, :count).by(1)
        .and change(Season, :count).by(0)
    end

    it "creates a games and a season when there is no active season" do
      league.seasons.update(active: false)

      expect do
        post "/leagues/#{league.id}/games", params: {game: game_attributes, active_season: "1"}
      end
        .to change(Game, :count).by(1)
        .and change(Season, :count).by(1)
    end

    it "creates a game and no season when checkbox is not checked" do
      expect do
        post "/leagues/#{league.id}/games", params: {game: game_attributes}
      end
        .to change(Game, :count).by(1)
        .and change(Season, :count).by(0)
    end
  end
end
