class User < ApplicationRecord
  has_secure_password
  has_many :memberships
  has_many :leagues, through: :memberships do
    def member
      where("memberships.role = ?", 0)
    end

    def admin
      where("memberships.role = ?", 1)
    end
  end

  def full_name
    first_name.present? ? "#{first_name} #{last_name}" : email
  end
end
