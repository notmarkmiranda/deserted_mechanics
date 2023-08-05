# Preview all emails at http://localhost:3000/rails/mailers/user
require "factory_bot_rails"

class UserPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user/welcome
  def welcome
    membership = FactoryBot.create(:membership)
    UserMailer.welcome(membership)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user/forgot_password
  def forgot_password
    user = FactoryBot.create(:user)
    UserMailer.forgot_password(user.email)
  end
end
