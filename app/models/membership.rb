class Membership < ApplicationRecord
  acts_as_paranoid

  belongs_to :league
  belongs_to :user
end
