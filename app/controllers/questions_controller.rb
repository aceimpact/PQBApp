class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = current_user.questions.new
    @question.question_images.build
  end

  def edit
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to root_url
  end

  private
  def question_params
    params.require(:question).permit(:content, :subject, question_images_attributes: [:id, :image_id])
  end

  def set_question
    @question = current_user.questions.find(params[:id])
  end
end
