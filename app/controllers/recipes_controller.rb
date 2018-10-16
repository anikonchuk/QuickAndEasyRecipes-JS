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
    
  end

  private

  def require_login
    redirect_to root_path unless session.include? :user_id
  end

  def recipe_params
    params.require(:recipe).permit(:name, :time, :instructions, ingredients_attributes: [:name, quantities: [:amount]])
  end

#{}"recipe"=>{"user_id"=>"1", "name"=>"PB & J", "time"=>"5", "ingredients_attributes"=>{"0"=>{"name"=>"Bread", "quantities"=>{"amount"=>"2 slices"}}, "1"=>{"name"=>"Peanut Butter", "quantities"=>{"amount"=>"1 tbsp"}}, "2"=>{"name"=>"Jelly", "quantities"=>{"amount"=>"1 tbsp"}}, "3"=>{"name"=>"", "quantities"=>{"amount"=>""}}, "4"=>{"name"=>"", "quantities"=>{"amount"=>""}}}, "instructions"=>"Spread peanut butter on one slice of bread. Spread jelly on the other. Sandwich together."}

end
