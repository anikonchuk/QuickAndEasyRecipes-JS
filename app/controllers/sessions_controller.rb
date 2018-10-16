class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
