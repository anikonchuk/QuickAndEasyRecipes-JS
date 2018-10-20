class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to recipes_path
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to recipes_path
      else
        flash[:alert] = "Something went wrong. Please try again."
        render :new
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
