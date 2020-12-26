class Menu < ApplicationRecord
  has_many :recipes, through: :menu_recipes
  accepts_nested_attributes_for :recipes
  has_many :menu_recipes
  accepts_nested_attributes_for :menu_recipes
  belongs_to :user
end
