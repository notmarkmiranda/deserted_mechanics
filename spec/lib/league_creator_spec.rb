require "rails_helper"
require "./lib/league_creator"

RSpec.describe LeagueCreator do
  let(:params) { attributes_for(:league) }
  let(:user) { create(:user) }

  it "creaes a league & membership" do
    creator = described_class.new(params, user)
    creator.save

    expect(creator.league).to be_a_kind_of(League)
    expect(creator.membership).to be_a_kind_of(Membership)
  end
end
