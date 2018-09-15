class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.notify.subject
  #
  def notify
    @greeting = params[:saludo]
    @user = params[:user]
    @comment = params[:comment]

    mail to: @user.email, subject: '#{@user.name} ha recibido un nuevo comentario' 
  end
end
