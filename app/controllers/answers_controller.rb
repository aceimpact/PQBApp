class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @answer = @question.answers.build(answer_params.merge!(user_id: current_user.id))
    if @answer.save
      redirect_to root_url
    else
      render "questions/show"
    end
  end

  def update
    @answer = @question.answers.find(params[:id])
    if @answer.update
      redirect_to root_url
    else
      render "questions/show"
    end
  end

  def destroy
    @answer.destroy!
    redirect_to root_url
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = @question.answers.find(params[:id])
  end
end
