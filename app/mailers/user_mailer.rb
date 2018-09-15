class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify.subject
  #
  def notify(user)
    @greeting = "Hi"
    @user = user

    mail to: @user.email, subject: 'test email'
  end
end
