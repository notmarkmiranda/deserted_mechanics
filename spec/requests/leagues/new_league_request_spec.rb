require "rails_helper"

RSpec.describe "New league", type: :request do
  let(:league_params) { { name: "Super Duper", private_league: true, location: "Your mom's house" } }

  # before do
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  # end

  xit "should create a new league and membership" do
    expect do
      post "/leagues", params: { league: league_params }
    end.to change(League, :count).by(1).
    and change(Membership, :count).by(1)
  end
end
