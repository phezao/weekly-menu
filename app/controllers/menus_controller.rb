class MenusController < ApplicationController
    def show
        @menu_recipes = current_user.menu.menu_recipes
    end
end
