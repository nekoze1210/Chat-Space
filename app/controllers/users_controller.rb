class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'ユーザー情報が更新されました。'
    else
      flash[:alert] = 'ユーザー情報の更新に失敗しました。'
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
