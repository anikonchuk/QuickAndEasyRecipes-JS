class RecipesController < ApplicationController

  before_action :require_login

  def landing
  end

  def index
    if params[:user_id] && current_user.id == params[:user_id].to_i
      @user = current_user
      @recipes = @user.recipes
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @recipes}
      end
    elsif params[:user_id]
      flash[:alert] = "You are not authorized to view this user's page."
      redirect_to recipes_path
    else
      @recipes = Recipe.all
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @recipes}
      end
    end
  end

  def new
    @user = current_user
    @recipe = Recipe.new(user_id: params[:user_id])
    10.times do
      quantity = @recipe.quantities.build
      quantity.build_ingredient
    end
    render :partial => 'recipes/form', :layout => false
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # @user = User.find_by(id: params[:user_id])
    if @recipe.save
      render json: @recipe, status: 201
    else
      # 10.times do
      #   quantity = @recipe.quantities.build
      #   quantity.build_ingredient
      # end
      render json: @recipe, status: 406
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @recipe}
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :time, :instructions, quantities_attributes: [:amount, ingredient_attributes: [:name]])
  end

end
