class Recipe < ApplicationRecord
belongs_to :user
belongs_to :menu
has_many :recipe_ingredients
has_many :ingredients, through: :recipe_ingredients


end
