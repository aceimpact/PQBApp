class QuestionLikesController < ApplicationController
  before_action :set_question

  def create
    @question_like = current_user.question_likes.create!(question_id: params[:question_id])
    respond_to :js
  end

  def destroy
    @question_like = current_user.question_likes.find_by(question_id: params[:question_id])
    @question_like.destroy!
    respond_to :js
  end

  private
  def set_question
    @question = Question.find(params[:question_id])
  end
end
