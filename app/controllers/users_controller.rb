class UsersController < ApplicationController
  def show
    # @user = User.find(1)
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in user
      flash[:success] = "アカウントの作成が完了しました。"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @user = User.new(user_params)
  end

  # ストロングパラメータ
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end