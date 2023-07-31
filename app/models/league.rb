class League < ApplicationRecord
  acts_as_paranoid

  validates :name, uniqueness: true, presence: true

  has_many :memberships
  has_many :users, through: :memberships do
    def members
      where("memberships.role = ?", 0)
    end

    def admin
      where("memberships.role = ?", 1)
    end
  end

end
