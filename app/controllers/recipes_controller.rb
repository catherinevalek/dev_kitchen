class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @category_names = Category.all.map { |c| c.name }
  end

  def create
    @recipe = Recipe.new(recipe_params)


  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
