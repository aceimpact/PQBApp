class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params.merge!(user_id: current_user.id))
    xxx
  end

  def destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
