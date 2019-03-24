# Preview all emails at http://localhost:3000/rails/mailers/answer_mailer
class AnswerMailerPreview < ActionMailer::Preview
  def send_mail
    user = User.new(name: "大場　啓太")

    AnswerMailer.send_mail(user)
  end
end
