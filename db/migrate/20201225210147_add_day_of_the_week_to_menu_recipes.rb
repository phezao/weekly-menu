class AddDayOfTheWeekToMenuRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_recipes, :day_of_the_week, :string
  end
end
