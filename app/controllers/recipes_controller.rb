class RecipesController < ApplicationController

  before_action :require_login

  def index
    if params[:user_id] && current_user.id == params[:user_id].to_i
      @user = current_user
      @recipes = @user.recipes
    elsif params[:user_id]
      flash[:alert] = "You are not authorized to view this user's page."
      redirect_to recipes_path
    else
      @recipes = Recipe.all
    end
  end

  def new
    if current_user.id == params[:user_id].to_i
      @user = current_user
      @recipe = Recipe.new(user_id: params[:user_id])
      10.times do
        quantity = @recipe.quantities.build
        quantity.build_ingredient
      end
    else
      flash[:alert] = "You are not authorized to create a recipe for another user."
      redirect_to recipes_path
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @user = User.find_by(id: params[:user_id])
    if @recipe.save
      redirect_to recipe_path(@recipe)
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
    if current_user.id == params[:user_id].to_i
      @recipe = @user.recipes.find_by(id: params[:id])
      @user = current_user
      if @recipe.nil?
        flash[:alert] = "Recipe not found in your collection."
        redirect_to user_recipes_path(@user)
      else
        5.times do
          quantity = @recipe.quantities.build
          quantity.build_ingredient
        end
      end
    else
      flash[:alert] = "You are not authorized to edit another user's recipe."
      redirect_to recipes_path
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
