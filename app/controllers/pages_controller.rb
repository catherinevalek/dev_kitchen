class PagesController < ApplicationController

  def home
  	@recipe = Recipe.new
  	@user = User.new
  	@menu = Menu.menu_today[0]
  	# binding.pry
  end


end
