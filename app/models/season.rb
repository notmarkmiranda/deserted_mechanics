class Season < ApplicationRecord
  acts_as_paranoid

  belongs_to :league
end
