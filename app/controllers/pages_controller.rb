class PagesController < ApplicationController

  def home
    @menu = Menu.find_by(user_id: current_user.id) || Menu.create(user_id: current_user.id)
  end
end
