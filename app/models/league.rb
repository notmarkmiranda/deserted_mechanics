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
  has_many :seasons, dependent: :destroy

  delegate :count, to: :seasons, prefix: true

  after_commit :create_initial_season

  private

  def create_initial_season
    seasons.create(active: true)
  end
end
