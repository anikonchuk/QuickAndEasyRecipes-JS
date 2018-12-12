class IngredientsController < ApplicationController

  before_action :require_login

  def index
    @ingredients = Ingredient.by_name
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @ingredients}
    end
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @ingredient}
    end
  end

end
