class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "編集に成功しました"
      redirect_to users_my_page_path
    else
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:nickname, :profile_image)
  end
end
