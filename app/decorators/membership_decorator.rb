class MembershipDecorator < ApplicationDecorator
  delegate_all

  def user_full_name
    user.decorate.full_name
  end

  def role_string
    (role == 0) ? "Member" : "Admin"
  end

  def status_string
    if membership.deactivated_at
      "DEACTIVATED - "
    end
  end
end
