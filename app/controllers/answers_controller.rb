class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :admin_user

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
    if @answer.update(answer_params)
      redirect_to root_url
    else
      render :edit
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

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
