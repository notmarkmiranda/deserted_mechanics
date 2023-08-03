class MembershipDecorator < ApplicationDecorator
  delegate_all

  def user_full_name
    user.first_name ? "#{user.first_name} #{user.last_name}" : user.email
  end

  def role_string
    role == 0 ? "Member" : "Admin"
  end

  def status_string
    if membership.deactivated_at
      "DEACTIVATED - "
    end
  end
end
