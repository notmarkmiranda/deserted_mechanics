class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(membership)
    token = membership.user.to_sgid(expires_in: 5.minutes, for: 'membership_invite')
    @invite_url = membership_invite_url(token)
    mail to: membership.user_email
  end
end
