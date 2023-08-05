class Membership < ApplicationRecord
  acts_as_paranoid column: :deactivated_at

  belongs_to :league
  belongs_to :user
  accepts_nested_attributes_for :user

  delegate :email, to: :user, prefix: true

  def user_has_no_email?
    user.email.blank?
  end
end
