class IngredientsController < ApplicationController

  before_action :require_login

  def index
    @ingredients = Ingredient.by_name
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
  end

end
