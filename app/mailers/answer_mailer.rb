class AnswerMailer < ApplicationMailer
  def answer_created(user)
    @user = user
    mail to: user.email
  end
end
