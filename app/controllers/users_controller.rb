class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @question = @user.questions
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
