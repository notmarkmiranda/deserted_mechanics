require "rails_helper"
require "./lib/league_destroyer"

RSpec.describe LeagueDestroyer do
  let(:membership) { create(:membership, role: 1) }
  let(:admin) { membership.user }
  let(:league) { membership.league }

  it "soft deletes a league" do
    described_class.destroy(league, admin.id)

    expect(League.count).to eq(0)
    expect(League.unscoped.count).to eq(1)
  end

  it "soft deletes memberships" do
    create_list(:membership, 2, league: league)
    described_class.destroy(league, admin.id)

    expect(league.memberships.count).to eq(1)
    expect(league.memberships.unscoped.count).to eq(3)
  end
end
