class MenusController < ApplicationController
    def show
        @menu_recipes = current_user.menu.menu_recipes
    end

    def edit
        @menu = Menu.find(params[:id])
    end

    def update
        @menu = Menu.update(menu_params)
        redirect_to menu_path(menu: current_user.menu)
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
