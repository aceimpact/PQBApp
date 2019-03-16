class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
    @search = Question.ransack(params[:q])
    @questions = @search.result.page(params[:page]).per(10).order(updated_at: :desc)
    @answers = Answer.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.build
    @answer.answer_images.build
    @question_like = QuestionLike.where(question_id: params[:question_id])
    @answer_like = AnswerLike.where(answer_id: params[:answer_id])
  end

  def new
    @question = current_user.questions.new
    @question.images.build
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
    if @question.update(question_param)
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
    params.require(:question).permit(:content, :subject, images_attributes: [:id, :file, :_destroy])
  end

  def set_question
    @question = current_user.questions.find(params[:id])
  end
end
