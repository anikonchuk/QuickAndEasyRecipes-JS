class UsersController < ApplicationController

    before_action :require_login, only: :index

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_recipes_path(@user)
    else
      render :new
    end
  end

  def index
    @users = User.by_name
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
