class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    user.first_name ? "#{user.first_name} #{user.last_name}" : user.email
  end
end
