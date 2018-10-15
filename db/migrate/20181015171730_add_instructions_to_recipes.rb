class AddInstructionsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :instructions, :text
  end
end
