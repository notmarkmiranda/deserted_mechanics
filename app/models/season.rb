class Season < ApplicationRecord
  acts_as_paranoid

  belongs_to :league
  has_many :games

  delegate :count, to: :games, prefix: true
end
