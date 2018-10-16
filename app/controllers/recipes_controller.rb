class RecipesController < ApplicationController

  before_action :require_login

  def index
    @recipes = Recipe.all
  end

  private

  def require_login
    redirect_to root_path unless session.include? :user_id
  end

end
