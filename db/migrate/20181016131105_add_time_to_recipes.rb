class AddTimeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :time, :integer
  end
end
