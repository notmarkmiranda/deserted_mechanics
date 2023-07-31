require "rails_helper"
require "./lib/league_creator"

RSpec.describe LeagueCreator do
  let(:params) { attributes_for(:league) }
  let(:user) { create(:user) }
  let(:creator) { described_class.new(params, user) }

  it "creates a league & membership" do
    creator.save

    expect(creator.league).to be_a_kind_of(League)
    expect(creator.membership).to be_a_kind_of(Membership)
  end

  it "creates an initial season for the league" do
    expect {
      creator.save
    }.to change(Season, :count).by(1)
  end
end
