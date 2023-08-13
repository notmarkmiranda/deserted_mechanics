require "rails_helper"

RSpec.describe Game, type: :model do
  it { should belong_to(:season).optional }
  it { should belong_to(:league).optional }
end
