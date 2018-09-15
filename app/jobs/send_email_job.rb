class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
  	@user = user
    UserMailer.notify(@user).deliver_later
  end
end
