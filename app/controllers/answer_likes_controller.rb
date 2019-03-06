class AnswerLikesController < ApplicationController
  before_action :set_answer
  before_action :set_question

  def create
    @answer_like = current_user.answer_likes.create!(answer_id: params[:answer_id])
    respond_to :js
  end

  def destroy
    @answer_like = current_user.answer_likes.find_by(answer_id: params[:answer_id])
    @answer_like.destroy!
    respond_to :js
  end

  private
  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
