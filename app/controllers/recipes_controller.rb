class RecipesController < ApplicationController

  before_action :require_login

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user
        @recipes = @user.recipes
      else
        flash[:alert] = "User not found."
        redirect_to recipes_path
      end
    else
      @recipes = Recipe.all
    end
  end

  def new
    @user = User.find_by(id: params[:user_id])
    if !User.exists?(params[:user_id])
      redirect_to recipes_path, alert: "User not found."
    else
      @recipe = Recipe.new(user_id: params[:user_id])
      5.times do
        @recipe.ingredients.build
      end
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      redirect_to recipes_path, alert: "User not found"
    else
      @recipe = @user.recipes.find_by(id: params[:id])
      redirect_to user_recipes_path(@user), alert: "Recipe not found" if @recipe.nil?
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  private

  def require_login
    redirect_to root_path unless session.include? :user_id
  end

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :time, :instructions, ingredients_attributes: [:name, quantities: [:amount]])
  end

end
