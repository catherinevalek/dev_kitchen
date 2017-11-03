class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:success] = "Your menu has been created!"
      redirect_to @menu
    else
      render :new
    end

  end

  def show
    @menu = Menu.find(params[:id])
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

    def menu_params
      params.require(:menu).permit(:appetizer_id, :salad_id, :main_course_id, :dessert_id, :date)
    end

    # def grab_params(params)
    #     params["menu"].each do | key, val |
    #     if key != "date"
    #       params["menu"][key] = Recipe.find(val.to_i)
    #     # else
    #     #   params["menu"][key] =
    #     end
    #   end
    #   params
    # end


end
