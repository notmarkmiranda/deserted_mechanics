require "rails_helper"

RSpec.describe League, type: :model do
  it { should have_many :memberships }
  it { should have_many(:users).through(:memberships) }
  it { should have_many :seasons }
  it { should have_many(:season_games).through(:seasons) }
  it { should have_many :games }
end
