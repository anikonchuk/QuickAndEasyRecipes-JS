module RecipesHelper

  def plural_ingredients(recipe)
    pluralize(recipe.ingredient_count, "ingredient")
  end
end
