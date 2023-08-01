require "rails_helper"

RSpec.describe League, type: :model do
  it { should have_many :memberships }
  it { should have_many(:users).through(:memberships) }
end
