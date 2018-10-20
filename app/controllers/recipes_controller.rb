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
      redirect_to recipes_path, flash[:alert] = "User not found."
    else
      @recipe = Recipe.new(user_id: params[:user_id])
      10.times do
        quantity = @recipe.quantities.build
        quantity.build_ingredient
      end
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @user = User.find_by(id: params[:user_id])
    if @recipe.save
      redirect_to recipes_path
    else
      10.times do
        quantity = @recipe.quantities.build
        quantity.build_ingredient
      end
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      redirect_to recipes_path, flash[:alert] = "User not found"
    else
      @recipe = @user.recipes.find_by(id: params[:id])
      if @recipe.nil?
        flash[:alert] = "Recipe not found"
        redirect_to user_recipes_path(@user)
      else
        5.times do
          quantity = @recipe.quantities.build
          quantity.build_ingredient
        end
      end
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      5.times do
        quantity = @recipe.quantities.build
        quantity.build_ingredient
      end
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def shortest
    @recipes = Recipe.by_shortest_time
  end

  def name
    @recipes = Recipe.by_name
    render 'name'
  end

  def recent
    @recipes = Recipe.by_recently_added
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :time, :instructions, quantities_attributes: [:amount, ingredient_attributes: [:name]])
  end

end
