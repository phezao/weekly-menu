class MenusController < ApplicationController
    def show
        @menu = Menu.find_by(user_id: current_user.id) || Menu.create(user_id: current_user.id)
        @menu_recipes = current_user.menu.menu_recipes
    end

    def edit
        @menu = Menu.find(params[:id])
    end

    def update
        @menu = Menu.update(menu_params)
        redirect_to menu_path(menu: current_user.menu)
    end

    def generate
        current_user.menu.menu_recipes.destroy_all
        recipes = 7.times.map{Recipe.all.sample}
        if current_user.menu.menu_recipes.empty?
            recipes.each_with_index do |recipe, index|
                menu_recipe = current_user.menu.menu_recipes.build(recipe_id: recipe.id, day_of_the_week: "#{index + 1}")
                menu_recipe.save
            end
        end
        redirect_to menu_path(current_user.menu)
    end

    private

    def menu_params
        params.require(:menu).permit(
            menu_recipes_attributes: [
                :day_of_the_week,
                :recipe_id,
                :id
            ]
        )
    end
end
