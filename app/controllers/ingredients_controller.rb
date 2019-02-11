class IngredientsController < ApplicationController

  before_action :require_login

  def index
    @ingredients = Ingredient.by_name
    render json: @ingredients, status: 201

  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    render json: @ingredient, status: 201
  end

end
