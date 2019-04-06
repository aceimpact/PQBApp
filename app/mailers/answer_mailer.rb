class AnswerMailer < ApplicationMailer
  def answer_created(user)
    @user = user
    mail to: @user.email,
         subject: '解答が届きました'
  end
end
