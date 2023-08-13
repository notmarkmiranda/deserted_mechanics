class Game < ApplicationRecord
  belongs_to :season, optional: true
  belongs_to :league, optional: true
end
