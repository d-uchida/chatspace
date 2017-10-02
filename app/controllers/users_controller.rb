class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
       redirect_to root_path, notice: "ユーザー情報を編集しました。"
    else
       flash.now[:alert] = "ユーザー情報を正しく入力してください"
       render "edit"
    end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email)
  end

end
