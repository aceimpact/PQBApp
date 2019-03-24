class AnswerMailer < ApplicationMailer
  def send_mail(user)
    @user = user
    mail to: user.email
  end
end
