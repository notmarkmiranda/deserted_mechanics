class League < ApplicationRecord
  acts_as_paranoid

  validates :name, uniqueness: true, presence: true

  has_many :memberships do
    def members
      where("memberships.role = ?", 0)
    end

    def admin
      where("memberships.role = ?", 1)
    end
  end
  has_many :users, through: :memberships do
    def members
      where("memberships.role = ?", 0)
    end

    def admin
      where("memberships.role = ?", 1)
    end
  end
  has_many :seasons, dependent: :destroy
  has_many :season_games, through: :seasons, source: :games
  has_many :games, dependent: :destroy

  delegate :count, to: :seasons, prefix: true
  delegate :count, to: :memberships, prefix: true

  after_commit :create_active_season

  def active_season
    seasons.find_by(active: true)
  end

  def create_active_season
    seasons.create(active: true)
  end

  def next_game
    season_games.or(games)
      .where(completed: false, date: DateTime.now..)
      .order(date: :asc)
      .limit(1)
      .first
  end
end
