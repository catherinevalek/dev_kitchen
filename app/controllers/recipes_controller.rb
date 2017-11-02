class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @category_info = Category.all.collect { |c| [c.name, c.id] }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    #need to find current user and assign them to recipe
    @recipe.user_id = 1
    if @recipe.save
      flash[:success] = "Your recipe has been added!"
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:category_id, :name, :difficulty, :prep_time, :ingredients, :directions)
  end
end
