class Menu < ApplicationRecord
  has_many :recipes, through: :menu_recipes
  has_many :menu_recipes
  belongs_to :user
end
