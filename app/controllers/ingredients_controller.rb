class IngredientsController < ApplicationController
    def new
        @ingredient = Ingredient.new
    end
    

    def create
        own = Ingredient.find_by(name: ingredient_params[:name])
        if own
            RecipeIngredient.create!(recipe_id: params[:recipe_id], ingredient: own)
            redirect_to new_recipe_ingredient_path(params[:recipe_id])
        else
            @ingredient = Ingredient.create!(ingredient_params)
            RecipeIngredient.create!(recipe_id: params[:recipe_id], ingredient: @ingredient)
            redirect_to new_recipe_ingredient_path(params[:recipe_id])
        end
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(
            :name
        )
    end
end
