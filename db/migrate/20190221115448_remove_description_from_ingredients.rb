class RemoveDescriptionFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :description, :text
  end
end
