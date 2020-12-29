class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @menu = Menu.find_by(user_id: current_user.id) || Menu.create(user_id: current_user.id)
    @recipes = Recipe.where(user: current_user)
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create!(user: current_user)
    @recipe.update(recipe_params)
    redirect_to new_recipe_ingredient_path(@recipe)
  end

  def edit
  end


  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  def new_to_menu
    @menu_recipe = MenuRecipe.new
  end

  def add_to_menu

    @menu_recipe = MenuRecipe.find_by(day_of_the_week: menu_recipe_params[:day_of_the_week])

    if @menu_recipe
      @menu_recipe.update(menu_recipe_params)
    else
      MenuRecipe.create!(menu_recipe_params)
    end

    redirect_to menu_path(current_user.menu)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :link
    )
  end

  def menu_recipe_params
    params.require(:menu_recipe).permit(
      :day_of_the_week,
      :menu_id,
      :recipe_id
    )
  end

end
