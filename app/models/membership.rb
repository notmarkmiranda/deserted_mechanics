class Membership < ApplicationRecord
  acts_as_paranoid column: :deactivated_at

  belongs_to :league
  belongs_to :user
  accepts_nested_attributes_for :user
end
