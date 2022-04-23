class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.time_records.any?
      @time_records = @user.time_records.paginate(page: params[:page])
      today = Time.now.to_a
      last = @time_records[-1].created_at.to_a
      @dates = (Date.new(last[5], last[4], last[3])...Date.new(today[5], today[4], today[3]+1)).to_a
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
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