class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(membership)
    @invite_url = membership_invite_url(token(membership.user, "membership_invite"))
    mail to: membership.user_email
  end

  def forgot_password(email)
    user = User.find_by(email: email)
    return unless user
    @reset_url = reset_password_url(token(user, "reset"))
    mail to: email
  end

  private

  def token(user, purpose)
    user.to_sgid(expires_in: 5.minutes, for: purpose)
  end
end
