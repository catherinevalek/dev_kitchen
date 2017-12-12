class PagesController < ApplicationController

  def home
  	@recipe = Recipe.new
  	@user = User.new
  	menu = Menu.menu_today[0]
  	if menu
  	  @menu = menu
  	else
  	  @menu = Menu.last
  	end
  end


end
