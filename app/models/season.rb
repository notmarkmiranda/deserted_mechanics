class Season < ApplicationRecord
  acts_as_paranoid

  belongs_to :league
  has_many :games
end
