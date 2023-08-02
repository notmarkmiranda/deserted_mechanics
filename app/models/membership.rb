class Membership < ApplicationRecord
  acts_as_paranoid

  belongs_to :league
  belongs_to :user
  accepts_nested_attributes_for :user
end
