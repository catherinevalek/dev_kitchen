class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
  end

  def show
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  # private

  #   def menu_params
  #     params.require(:menu).permit(#things to allow from menu form)
  #   end


end
