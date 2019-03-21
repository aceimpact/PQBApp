class UsersController < ApplicationController

  def show
    @search = Question.ransack(user_id_eq: current_user.id, content_cont: params[:question_content])
    @question = @search.result.page(params[:page]).per(10).order(updated_at: :desc)
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
