class AnswersController < ApplicationController
  before_action :set_question, only: [:edit, :create, :update, :destroy]
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :teacher_user, only: [:edit, :create, :update, :destroy]

  def show
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def edit
  end

  def create
    @answer = @question.answers.build(answer_params.merge!(user_id: current_user.id))
    if @answer.save
      redirect_to root_url
    else
      render :new
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
    params.require(:answer).permit(:content, answer_images_attributes: [:id, :file, :_destroy])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = @question.answers.find(params[:id])
  end

  def teacher_user
    redirect_to(root_path) unless current_user.teacher?
  end
end
