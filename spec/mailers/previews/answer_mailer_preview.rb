# Preview all emails at http://localhost:3000/rails/mailers/answer_mailer
class AnswerMailerPreview < ActionMailer::Preview
  def answer_created
    user = User.new(name: "大場　啓太")

    AnswerMailer.answer_created(user)
  end
end
