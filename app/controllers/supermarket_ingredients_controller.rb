class SupermarketIngredientsController < ApplicationController

    def index
        menu = Menu.find(params[:menu_id])
        @recipes = menu.recipes
        @recipes_ingredient = @recipes.map{|recipe| recipe.ingredients}
    end
end
