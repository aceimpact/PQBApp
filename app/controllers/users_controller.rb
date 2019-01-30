class UsersController < ApplicationController
  
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
end
