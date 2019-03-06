class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @question = @user.questions
    @question_likes = QuestionLike.where(user_id: current_user.id)
    @answer_likes = AnswerLike.where(user_id: current_user.id)
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
