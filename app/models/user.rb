class User < ApplicationRecord
  has_secure_password
  has_many :memberships do
    def member
      where("memberships.role = ?", 0)
    end

    def admin
      where("memberships.role = ?", 1)
    end
  end

  has_many :leagues, through: :memberships do
    def member
      where("memberships.role = ?", 0)
    end

    def admin
      where("memberships.role = ?", 1)
    end
  end

  def is_admin_for?(other_user)
    (memberships.admin.pluck(:league_id) & other_user.memberships.pluck(:league_id)).any?
  end
end
