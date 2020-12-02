class Recipe < ApplicationRecord
belongs_to :user
has_many :menus, through: :menu_recipes
has_many :menu_recipes
has_many :recipe_ingredients
has_many :ingredients, through: :recipe_ingredients


end
